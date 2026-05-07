import 'package:booklyapp/Features/home/preesentation/widgets/BestSellerListViewItem.dart';
import 'package:booklyapp/Features/home/data/models/BookModel.dart'; // لا تنسَ الاستيراد
import 'package:flutter/material.dart';

class SearchResulitListView extends StatelessWidget {
  const SearchResulitListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => BestSellerListViewItem(
          // تمرير كتاب وهمي مؤقتاً
          book: BookModel(
            title: 'نتيجة بحث تجريبية',
            authorName: 'جاري البحث...',
            coverUrl: 'https://via.placeholder.com/150',
          ),
        ),
      ),
    );
  }
}