import 'package:booklyapp/Features/home/preesentation/manger/FeaturedBooks_cubit/FeaturedBooks_cubit.dart';
import 'package:booklyapp/Features/home/preesentation/manger/FeaturedBooks_cubit/FeaturedBooks_state.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/BookListViewItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// لا تنسَ استيراد مسارات الـ Cubit والـ State هنا

class custoumListView extends StatelessWidget {
  const custoumListView({super.key});

  @override
  Widget build(BuildContext context) {
    // نستخدم BlocBuilder للاستماع لحالات الـ FeaturedBooksCubit
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          // 1. حالة النجاح: نعرض القائمة بالبيانات الحقيقية
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length, // طول القائمة الحقيقي
                itemBuilder: (context, index) {
                  // يجب تعديل BookListViewItem ليستقبل الـ book الحالي ويعرض صورته
                  return BookListViewItem(book: state.books[index]);
                },
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          // 2. حالة الفشل: نعرض رسالة الخطأ
          return Center(child: Text(state.errMessage));
        } else {
          // 3. حالة التحميل (Loading): نعرض دائرة تحميل
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}