import 'package:booklyapp/Features/home/data/models/BookModel.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/BookListViewItem.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/BookRateing.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/BooksAction.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/CustomBookDeatelsAppBar.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/similarBooksListView.dart';
import 'package:flutter/material.dart';
// ... (باقي الاستيرادات الخاصة بك)

class Bookdetailesbody extends StatelessWidget {
  // 1. أضفنا الكتاب كمتغير مطلوب
  const Bookdetailesbody({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const CustomBookDeatelsAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .19),
              // 2. نمرر الكتاب ليعرض غلافه الحقيقي
              child: BookListViewItem(book: book),
            ),
            const SizedBox(height: 40),
            Text(
              book.title, // 3. عنوان الكتاب الحقيقي
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 7),
            Text(
              book.authorName ?? 'مؤلف غير معروف', // 4. المؤلف الحقيقي
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            const BookRating(), // يمكنك تمرير تقييم الكتاب هنا لاحقاً
            const SizedBox(height: 20),
// استبدل السطر القديم: BooksAction(), 
// بهذا السطر:
BooksAction(book: book),            const SizedBox(height: 40),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "You can also like",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 23),
            const similarBooksListView(),
          ],
        ),
      ),
    );
  }
}
