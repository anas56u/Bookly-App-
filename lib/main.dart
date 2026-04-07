import 'package:booklyapp/Features/splash/presentation/views/Splash_view.dart';
import 'package:booklyapp/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BooklyApp());
}

class BooklyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kprimarycolor,
        textTheme:  GoogleFonts.montserratTextTheme( ThemeData.dark().textTheme), 
      ),
      debugShowCheckedModeBanner: false,
      home:SplashView() ,
    );
  }
}
