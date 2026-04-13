import 'package:booklyapp/Features/home/preesentation/widgets/BookRateing.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/BooksAction.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/CustomBookDeatelsAppBar.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/BookListViewItem.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/similarBooksListView.dart';
import 'package:booklyapp/core/utlis/styles.dart';
import 'package:booklyapp/core/widgets/button.dart';
import 'package:flutter/material.dart';

class Bookdetailesbody extends StatelessWidget {
  const Bookdetailesbody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomBookDeatelsAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .19),
              child: BookListViewItem(),
            ),
            Text(
              "just a book name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 7),
            Text(
              "just a book author",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            BookRating(),
            SizedBox(height: 20),
            BooksAction(),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "you can also like ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 23),
            similarBooksListView(),
          ],
        ),
      ),
    );
  }
}
