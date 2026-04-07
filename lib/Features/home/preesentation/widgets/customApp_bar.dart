import 'package:booklyapp/core/utlis/assets.dart';
import 'package:flutter/material.dart';

class customApp_bar extends StatelessWidget {
  const customApp_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 20),
      child: Row(
        children: [
          Image.asset(Assets.logo, height: 18),
          const Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 25)),
        ],
      ),
    );
  }
}
