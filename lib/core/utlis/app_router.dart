import 'package:booklyapp/Features/home/preesentation/views/book_detailsview.dart';
import 'package:booklyapp/Features/home/preesentation/views/homeView.dart';
import 'package:booklyapp/Features/search/presentation/views/SearchView.dart';
import 'package:booklyapp/Features/splash/presentation/views/Splash_view.dart';
import 'package:go_router/go_router.dart';
import 'package:booklyapp/Features/home/data/models/BookModel.dart';

// 👇 استيرادات ضرورية جداً لكي يعمل الـ Cubit
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:booklyapp/Features/home/preesentation/manger/similar_books_cubit/similar_books_cubit.dart'; 
import 'package:booklyapp/core/utlis/service_locator.dart'; 
import 'package:booklyapp/Features/home/data/repos/home_repo.dart'; 

abstract class AppRouter {
  static const String splashView = "/";
  static const String homeView = "/HomeView";
  static const String bookDetailsView = "/BookDetailsView";
  static const String searchView = "/SearchView";
  static final router = GoRouter(
  
    routes: [
      GoRoute(path: splashView, builder: (context, state) =>  SplashView()),
      GoRoute(path: homeView, builder: (context, state) =>  Homeview()),
      
      // 👇 التعديل الجذري هنا
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) {
          // 1. نستقبل الكتاب
          final book = state.extra as BookModel; 
          
          // 2. نوفر الـ Cubit لشاشة التفاصيل لكي لا تنهار
          return BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepo>())
              ..fetchSimilarBooks(category: book.authorName ?? 'computer'),
            child: BookDetailsview(book: book),
          );
        },
      ),
      // 👆 نهاية التعديل الجذري

      GoRoute(path: searchView, builder: (context, state) => const Searchview()),
    ],
  );
}