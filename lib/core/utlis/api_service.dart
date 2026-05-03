import 'package:dio/dio.dart';

class ApiService {
  // استخدمنا الرابط الأساسي الخاص بـ Open Library
  final _baseUrl = 'https://openlibrary.org/';
  final Dio _dio;

  ApiService(this._dio);

  // دالة الـ Get العامة
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}