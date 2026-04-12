import 'package:booklyapp/Features/home/preesentation/widgets/BookDetailesBody.dart';
import 'package:flutter/material.dart';

class BookDetailsview extends StatelessWidget {
  const BookDetailsview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Bookdetailesbody()),
      
    );
  }
}