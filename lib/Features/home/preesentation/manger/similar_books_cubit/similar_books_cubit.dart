import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo.dart';
import 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  // حقن التبعية (Dependency Injection) لـ HomeRepo
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    // 1. إرسال حالة التحميل للـ UI
    emit(SimilarBooksLoading());
    
    // 2. جلب البيانات من الـ Repo
    var result = await homeRepo.fetchSimilarBooks(category: category);
    
    // 3. معالجة النتيجة باستخدام fold (لأننا نستخدم Either من dartz)
    result.fold(
      (failure) {
        // حالة الفشل: نرسل رسالة الخطأ
        emit(SimilarBooksFailure(failure.errMessage));
      },
      (books) {
        // حالة النجاح: نرسل قائمة الكتب
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}