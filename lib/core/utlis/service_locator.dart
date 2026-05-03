import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../Features/home/data/repos/home_repo_imp.dart';
import 'api_service.dart'; // تأكد من مسار الاستدعاء

final getIt = GetIt.instance;

void setupServiceLocator() {
  // 1. نسجل الـ ApiService ونعطيه Dio
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // 2. نسجل HomeRepoImpl ونمررله الـ ApiService من GetIt (هون بنحل الخطأ)
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>() as Dio, 
    ),
  );
}