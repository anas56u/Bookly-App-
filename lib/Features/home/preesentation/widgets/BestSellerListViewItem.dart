import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:booklyapp/core/utlis/app_router.dart';
import 'package:booklyapp/Features/home/data/models/BookModel.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/BookRateing.dart';

class BestSellerListViewItem extends StatelessWidget {
  // 1. طلب تمرير كائن الكتاب في الـ Constructor
  const BestSellerListViewItem({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // لاحقاً سنمرر الـ book لهذه الشاشة أيضاً لتعرض تفاصيله
GoRouter.of(context).push(AppRouter.bookDetailsView, extra: book);      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. استخدام CachedNetworkImage مع ClipRRect لغلاف الكتاب
            SizedBox(
              height: 125, // ارتفاع مناسب للقائمة العمودية
              child: AspectRatio(
                aspectRatio: 2.5 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
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
            ),
            const SizedBox(width: 20),
            
            // 3. عرض تفاصيل الكتاب
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      book.title, // العنوان الحقيقي من الـ API
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'GT Sectra Fine',
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    book.authorName ?? 'مؤلف غير معروف', // اسم المؤلف
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Free", // غيرناها من 19.99 لأن Open Library يقدم كتباً مجانية
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // عنصر التقييم (يمكنك لاحقاً تمرير book.rating له إذا أحببت)
                      const BookRating(), 
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