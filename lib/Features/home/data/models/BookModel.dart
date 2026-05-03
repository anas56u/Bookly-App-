class BookModel {
  final String title;
  final String? authorName;
  final String? coverUrl;
  final num? rating; 

  BookModel({
    required this.title,
    this.authorName,
    this.coverUrl,
    this.rating,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'] ?? 'عنوان غير متوفر',
      // المؤلفون في Open Library يأتون على شكل قائمة (List)
      authorName: (json['author_name'] as List<dynamic>?)?.first ?? 'مؤلف غير معروف',
      // الـ API يرجع رقم الـ cover_i، نستخدمه لجلب الصورة من الرابط المخصص للصور
      coverUrl: json['cover_i'] != null 
          ? 'https://covers.openlibrary.org/b/id/${json['cover_i']}-L.jpg' 
          : null,
      rating: json['ratings_average'] ?? 0.0,
    );
  }
}