import 'package:booklyapp/Features/home/preesentation/views/book_detailsview.dart';
import 'package:booklyapp/Features/home/preesentation/views/homeView.dart';
import 'package:booklyapp/Features/search/presentation/views/SearchView.dart';
import 'package:booklyapp/Features/splash/presentation/views/Splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splashView = "/";
  static const String homeView = "/HomeView";
  static const String bookDetailsView = "/BookDetailsView";
  static const String searchView = "/SearchView";
  static final router = GoRouter(
    routes: [
      GoRoute(path: splashView, builder: (context, state) => SplashView()),
      GoRoute(path: homeView, builder: (context, state) => Homeview()),
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) => BookDetailsview(),
      ),
      GoRoute(path: searchView, builder: (context, state) => Searchview()),
    ],
  );
}
