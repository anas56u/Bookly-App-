import 'package:booklyapp/Features/home/preesentation/widgets/BookRateing.dart';
import 'package:booklyapp/core/utlis/app_router.dart';
import 'package:booklyapp/core/utlis/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsView);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          // هذه الخاصية تجعل الصورة والنصوص تبدأ من أعلى الـ Row وليس من منتصفه
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. الجزء الأول: الصورة
            SizedBox(
              height: 158,
              child: AspectRatio(
                aspectRatio: 1.5 / 2.5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage(Assets.test_image),
                      fit: BoxFit.cover, // مهم جداً لملء الحواف الدائرية
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 20),
            Expanded(
              child: Column(
                // هذه الخاصية تجبر جميع النصوص على البدء من اليسار
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // العنوان
                  const Text(
                    "Harry Potter and the Goblet of Fire",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20, // تكبير الخط ليطابق التصميم
                      fontWeight: FontWeight.normal,
                      fontFamily:
                          'GT Sectra Fine', // إذا كان لديك الخط المخصص للتطبيق
                    ),
                  ),

                  const SizedBox(height: 10), // مسافة للتنفس
                  // اسم المؤلف
                  const Text(
                    "J.K. Rowling",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey, // لون رمادي ليطابق التصميم
                    ),
                  ),

                  const SizedBox(height: 10), // مسافة للتنفس
                  // السعر
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // لتوزيع السعر والتقييم على طرفي الـ Row
                    children: [
                      Text(
                        "19.99 €",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold, // خط عريض للسعر
                        ),
                      ),
                      BookRating(), // إضافة تقييم الكتاب بجانب السعر
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
