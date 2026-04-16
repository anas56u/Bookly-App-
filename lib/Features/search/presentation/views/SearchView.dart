import 'package:booklyapp/Features/search/presentation/views/widgets/searchViewBody.dart';
import 'package:flutter/material.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Searchviewbody()));
  }
}
