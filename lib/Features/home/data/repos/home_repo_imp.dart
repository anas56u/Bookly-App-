import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utlis/api_service.dart'; // تأكد من استيراد ApiService
import '../models/BookModel.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  // 1. التعديل هنا: استخدمنا ApiService بدلاً من Dio
  final ApiService apiService; 

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      // 2. التعديل هنا: استخدمنا apiService.get ومررنا الـ endPoint فقط
// ✅ استدعاء صحيح (مُعامل مُسمى)
var data = await apiService.get(
  endPoint: 'search.json?q=programming&limit=10',
);      
      List<BookModel> books = [];
      // 3. التعديل هنا: ApiService ترجع البيانات كـ Map مباشرة، لذلك نستخدم data['docs']
      for (var item in data['docs']) {
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      // نفس التعديل هنا أيضاً
// ✅ استدعاء صحيح (مُعامل مُسمى)
var data = await apiService.get(
  endPoint: 'search.json?q=computer+science&sort=new&limit=10',
);      
      List<BookModel> books = [];
      for (var item in data['docs']) {
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

  @override
Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async {
  try {
    // سنبحث عن كتب تحتوي على نفس الكلمة (مثلاً اسم المؤلف أو التصنيف)
    var data = await apiService.get(endPoint: 'search.json?q=$category&limit=10');
    
    List<BookModel> books = [];
    for (var item in data['docs']) {
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