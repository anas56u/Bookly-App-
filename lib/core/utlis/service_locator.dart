import 'package:booklyapp/Features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../Features/home/data/repos/home_repo_imp.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // 1. إعداد خيارات Dio الأساسية (BaseOptions) لزيادة وقت الانتظار
  BaseOptions options = BaseOptions(
    connectTimeout: const Duration(seconds: 15), // أقصى مدة للاتصال بالسيرفر
    receiveTimeout: const Duration(seconds: 15), // أقصى مدة لاستقبال البيانات
  );

  // 2. تمرير هذه الخيارات عند إنشاء نسخة Dio
  Dio dio = Dio(options);

  // 3. تسجيل الخدمات
  getIt.registerSingleton<ApiService>(ApiService(dio));
  
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(getIt.get<ApiService>()),
  );
}