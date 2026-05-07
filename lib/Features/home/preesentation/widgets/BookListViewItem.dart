import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // 👈 استيراد هام جداً
import 'package:cached_network_image/cached_network_image.dart';
import 'package:booklyapp/Features/home/data/models/BookModel.dart';
import 'package:booklyapp/core/utlis/app_router.dart'; // 👈 استيراد الروتر

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    // 1. قمنا بإضافة GestureDetector لكي نستمع للضغطات
    return GestureDetector(
      onTap: () {
        // 2. هنا نرسل الكتاب (book) داخل الـ extra إلى شاشة التفاصيل
        GoRouter.of(context).push(AppRouter.bookDetailsView, extra: book);
      },
      child: AspectRatio(
        aspectRatio: 1.5 / 2.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: book.coverUrl ?? 'https://via.placeholder.com/150',
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}