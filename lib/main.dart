import 'package:booklyapp/Features/splash/presentation/views/Splash_view.dart';
import 'package:booklyapp/consts.dart';
import 'package:booklyapp/core/utlis/app_router.dart';
import 'package:booklyapp/core/utlis/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator(); // لازم تتنفذ قبل runApp
  runApp(BooklyApp());
}

class BooklyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kprimarycolor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
