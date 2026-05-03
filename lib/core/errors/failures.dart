import 'package:dio/dio.dart';

// 1. الكلاس الأساسي (Base Class)
abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

// 2. كلاس مخصص لأخطاء الخادم (Server Errors)
class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  // Factory Constructor: وظيفته استقبال خطأ Dio وتحليله، ثم إرجاع رسالة مناسبة
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('انتهى وقت الاتصال بالخادم (Connection timeout)');
      case DioExceptionType.sendTimeout:
        return ServerFailure('انتهى وقت إرسال الطلب (Send timeout)');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('انتهى وقت استقبال البيانات (Receive timeout)');
      case DioExceptionType.badCertificate:
        return ServerFailure('شهادة الأمان غير صالحة (Bad certificate)');
      case DioExceptionType.badResponse:
        // إذا رد السيرفر ولكن برمز خطأ (مثل 400، 404، 500)
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('تم إلغاء الطلب (Request cancelled)');
      case DioExceptionType.connectionError:
        return ServerFailure('لا يوجد اتصال بالإنترنت (No Internet Connection)');
      case DioExceptionType.unknown:
        // التقاط أي أخطاء أخرى غير متوقعة
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('لا يوجد اتصال بالإنترنت');
        }
        return ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة لاحقاً');
      default:
        return ServerFailure('أوبس! حدث خطأ ما، يرجى المحاولة مرة أخرى');
    }
  }

  // دالة مساعدة لمعالجة أخطاء الرد (Bad Response) بناءً على الـ Status Code
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      // عادة السيرفر يرسل رسالة الخطأ داخل الـ response
      return ServerFailure(response['error']['message'] ?? 'طلب غير صالح أو غير مصرح به');
    } else if (statusCode == 404) {
      return ServerFailure('طلبك غير موجود (404 Not found)');
    } else if (statusCode == 500) {
      return ServerFailure('خطأ داخلي في الخادم (500 Internal Server error)');
    } else {
      return ServerFailure('أوبس! حدث خطأ ما، يرجى المحاولة مرة أخرى');
    }
  }
}