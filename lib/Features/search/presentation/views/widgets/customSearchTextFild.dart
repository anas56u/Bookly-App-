import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // 1. تحديد شكل ولون النص الذي سيكتبه المستخدم
      style: const TextStyle(color: Colors.white), 
      
      // 2. الديكور (Decoration) للتحكم بالشكل بالكامل
      decoration: InputDecoration(
        // النص الإرشادي الذي يختفي عند الكتابة
        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.white54),
        
        // 3. أيقونة البحث (وضعناها كـ Suffix لتظهر في نهاية الحقل)
        suffixIcon: IconButton(
          onPressed: () {
            // سنضع هنا منطق البحث لاحقاً
          },
          icon: const Opacity(
            opacity: 0.8, // تقليل الشفافية قليلاً لتبدو أكثر أناقة
            child: Icon(
              Icons.search,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        
        // 4. شكل الإطار في الحالة العادية (قبل الضغط عليه)
        enabledBorder: buildOutlineInputBorder(),
        
        // 5. شكل الإطار عند الضغط عليه (Focus) للبدء بالكتابة
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  // 🧠 مبدأ الـ Clean Code (DRY):
  // بدلاً من كتابة كود الـ OutlineInputBorder مرتين (للعادي والمضغوط)
  // قمنا باستخراجه في دالة منفصلة تعيد شكل الإطار المطلوب.
  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white, // لون الإطار
      ),
      borderRadius: BorderRadius.circular(12), // درجة انحناء الزوايا
    );
  }
}