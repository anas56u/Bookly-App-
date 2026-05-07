class BookModel {
  final String title;
  final String? authorName;
  final String? coverUrl;
  final num? rating;
  final String? bookUrl; // 👈 1. أضفنا هذا المتغير

  BookModel({
    required this.title,
    this.authorName,
    this.coverUrl,
    this.rating,
    this.bookUrl, // 👈 2. أضفناه في الـ Constructor
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'] ?? 'عنوان غير متوفر',
      authorName: (json['author_name'] as List<dynamic>?)?.first ?? 'مؤلف غير معروف',
      coverUrl: json['cover_i'] != null 
          ? 'https://covers.openlibrary.org/b/id/${json['cover_i']}-L.jpg' 
          : null,
      rating: json['ratings_average'] ?? 0.0,
      // 👇 3. التعديل هنا: نأخذ الـ key ونركبه مع رابط الموقع
      bookUrl: json['key'] != null 
          ? 'https://openlibrary.org${json['key']}' 
          : null,
    );
  }
}