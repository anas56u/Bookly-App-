import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();
  static const String primaryFont = 'SF Pro Text';
  static const Color primaryText = Colors.white;
  static const Color secondaryText = Color(0xFF9E9E9E);
  static const Color mutedText = Color(0xFF616161);
  static const Color buttonTextColor = Colors.white;

  static const TextStyle titleLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 32,
    fontWeight: FontWeight.w700, // Bold
    color: primaryText,
  );
  static const TextStyle sectionHeader = TextStyle(
    fontFamily: primaryFont,
    fontSize: 19,
    fontWeight: FontWeight.w600,
    color: primaryText,
  );
  static const TextStyle listBookTitle = TextStyle(
    fontFamily: primaryFont,
    fontSize: 18,
    fontWeight: FontWeight.w700, // Bold
    color: primaryText,
  );

  // هـ. اسم المؤلف والسعر في القائمة - عادي، بلون رمادي
  // < AppTextStyles.listAuthorPrice >
  static const TextStyle listAuthorPrice = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    color: secondaryText,
  );

  // و. رقم التقييم (الرقم نفسه) - أبيض، سميك
  // < AppTextStyles.ratingScore >
  static const TextStyle ratingScore = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w700, // Bold
    color: primaryText,
  );

  // ز. عدد التقييمات (داخل الأقواس) - أصغر، بلون رمادي غامق
  // < AppTextStyles.ratingCount >
  static const TextStyle ratingCount = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w400, // Regular
    color: mutedText,
  );

  // ح. نص الزر الكبير - سميك جداً، كبير، وأبيض
  // < AppTextStyles.buttonLarge >
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 18,
    fontWeight: FontWeight.w800, // Extra Bold
    color: buttonTextColor,
  );
}
