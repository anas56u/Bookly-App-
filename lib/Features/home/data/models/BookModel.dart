
import 'package:collection/collection.dart';

class BookModel {
  final String? title;
  final List<String>? authorName;
  final int? firstPublishYear;
  final int? coverI;
  final String? key;
  final int? editionCount;

  const BookModel({
    this.title,
    this.authorName,
    this.firstPublishYear,
    this.coverI,
    this.key,
    this.editionCount,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'] as String?,
      authorName: (json['author_name'] as List<dynamic>?)?.cast<String>(),
      firstPublishYear: json['first_publish_year'] as int?,
      coverI: json['cover_i'] as int?,
      key: json['key'] as String?,
      editionCount: json['edition_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author_name': authorName,
      'first_publish_year': firstPublishYear,
      'cover_i': coverI,
      'key': key,
      'edition_count': editionCount,
    };
  }

  // ==========================================
  // الدوال المساعدة للواجهة (UI Helpers)
  // ==========================================

  // توليد رابط الصورة تلقائياً من رقم الغلاف
  String get coverImageUrl {
    if (coverI != null) {
      return 'https://covers.openlibrary.org/b/id/$coverI-L.jpg';
    }
    return 'https://via.placeholder.com/150x200.png?text=No+Cover';
  }

  // استخراج اسم المؤلف الأول بأمان
  String get author {
    if (authorName != null && authorName!.isNotEmpty) {
      return authorName!.first;
    }
    return 'Unknown Author';
  }

  // ==========================================
  // المقارنة الآمنة (Equality)
  // ==========================================

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BookModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    // تم إصلاح استدعاء الدالة ليكون toJson()
    return mapEquals(other.toJson(), toJson()); 
  }

  @override
  int get hashCode =>
      title.hashCode ^
      authorName.hashCode ^
      firstPublishYear.hashCode ^
      coverI.hashCode ^
      key.hashCode ^
      editionCount.hashCode;
}