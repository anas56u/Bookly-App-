import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // لجعل العناصر تأخذ مساحتها الطبيعية فقط دون التمدد
      mainAxisSize: MainAxisSize.min, 
      children: [
        // أيقونة النجمة
        const Icon(
          Icons.star,
          color: Colors.amber, // لون ذهبي/أصفر
          size: 20, // التحكم بحجم الأيقونة لتناسب النص
        ),
        const SizedBox(width: 6.3),
        
        // التقييم (الرقم)
        const Text(
          "4.8",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        
        // عدد المقيمين
        Text(
          "(2390)",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600, // لون رمادي خفيف
          ),
        ),
      ],
    );
  }
}