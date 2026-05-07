import 'package:booklyapp/Features/home/data/models/BookModel.dart';
import 'package:booklyapp/core/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // 👈 استيراد الحزمة

class BooksAction extends StatelessWidget {
  // 1. طلبنا الكتاب في الـ Constructor
  const BooksAction({super.key, required this.book}); 
  
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: Button(
              textcolor:Colors.black ,
              
              backgroundcolor: Colors.white,
             borderradues: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              text: "Free",
            ),
          ),
          Expanded(
            child: Button(
              // 2. تفعيل دالة الضغط
              onPressed: () async {
                // استدعاء دالة فتح الرابط
                await launchCustomUrl(context, book.bookUrl);
              },
              backgroundcolor: const Color(0xffef8262),
              textcolor: Colors.white,
              borderradues: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              text: "Free Preview",
            ),
          )
        ],
      ),
    );
  }

  // 💡 دالة مساعدة لفتح الرابط باحترافية مع معالجة الأخطاء
  Future<void> launchCustomUrl(BuildContext context, String? url) async {
    if (url != null) {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        // في حال فشل فتح المتصفح
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('عذراً، لا يمكن فتح هذا الرابط')),
          );
        }
      }
    } else {
      // في حال كان الكتاب لا يمتلك رابطاً في الـ API
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('لا يوجد رابط متاح لهذا الكتاب')),
        );
      }
    }
  }
}