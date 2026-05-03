import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/BookModel.dart';

abstract class HomeRepo {
  // جلب الكتب المميزة
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  
  // جلب أحدث الكتب
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
}