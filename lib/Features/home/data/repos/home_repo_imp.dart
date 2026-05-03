import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../models/BookModel.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final Dio dio;

  // حقن التبعية (Dependency Injection)
  HomeRepoImpl(this.dio);

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      // جلب كتب عن البرمجة كمثال للكتب المميزة
      var response = await dio.get('https://openlibrary.org/search.json?q=programming');
      
      List<BookModel> books = [];
      // حلقة تكرارية لتحويل كل عنصر JSON إلى كائن BookModel
      for (var item in response.data['docs']) {
        books.add(BookModel.fromJson(item));
      }
      
      return right(books); // إرجاع البيانات في حالة النجاح (يمين)

    } catch (e) {
      // معالجة الأخطاء
      if (e is DioException) {
        // إذا كان الخطأ من الشبكة أو الـ API
        return left(ServerFailure.fromDioError(e)); // إرجاع الخطأ في حالة الفشل (يسار)
      }
      // إذا كان الخطأ غير معروف (مثلاً مشكلة في تحويل الـ JSON)
      return left(ServerFailure(e.toString())); 
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      // جلب كتب علوم الحاسوب وترتيبها من الأحدث للأقدم
      var response = await dio.get('https://openlibrary.org/search.json?q=computer+science&sort=new');
      
      List<BookModel> books = [];
      for (var item in response.data['docs']) {
        books.add(BookModel.fromJson(item));
      }
      
      return right(books);

    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}