import 'package:booklyapp/Features/home/preesentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:booklyapp/Features/home/preesentation/manger/similar_books_cubit/similar_books_state.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/BookListViewItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class similarBooksListView extends StatelessWidget {
  const similarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    // نستخدم BlocBuilder للاستماع للـ SimilarBooksCubit
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length, // العدد الحقيقي للكتب المشابهة
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: BookListViewItem(
                    book: state.books[index], // تمرير الكتاب الفعلي
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          // عرض رسالة الخطأ في حال الفشل
          return Center(child: Text(state.errMessage));
        } else {
          // عرض دائرة التحميل أثناء جلب البيانات
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}