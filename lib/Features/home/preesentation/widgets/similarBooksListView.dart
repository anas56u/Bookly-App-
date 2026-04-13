import 'package:booklyapp/Features/home/preesentation/widgets/BookListViewItem.dart';
import 'package:flutter/material.dart';

class similarBooksListView extends StatelessWidget {
  const similarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return BookListViewItem();
        },
      ),
    );
  }
}
