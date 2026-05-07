import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/BestSellerListViewItem.dart';
import 'package:booklyapp/Features/home/preesentation/manger/NewsetBooksCubit/NewsetBooks_Cubit.dart';
import 'package:booklyapp/Features/home/preesentation/manger/NewsetBooksCubit/NewsetBooks_State.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(
                  book: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewsetBooksFailure) {
          // التعديل الاحترافي: واجهة الخطأ مع زر إعادة المحاولة
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 50),
                const SizedBox(height: 15),
                Text(
                  state.errMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    // هنا نطلب من الـ Cubit إعادة جلب البيانات مرة أخرى
                    context.read<NewsetBooksCubit>().fetchNewestBooks();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'إعادة المحاولة',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}