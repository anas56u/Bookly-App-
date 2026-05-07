import 'package:booklyapp/Features/home/data/models/BookModel.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/BookDetailesBody.dart';
import 'package:flutter/material.dart';

class BookDetailsview extends StatelessWidget {
  // 1. أضفنا الكتاب كمتغير مطلوب
  const BookDetailsview({super.key, required this.book});
  
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // 2. نمرره للـ Body
        child: Bookdetailesbody(book: book),
      ),
    );
  }
}