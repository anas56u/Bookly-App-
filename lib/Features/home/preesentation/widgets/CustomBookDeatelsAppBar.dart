import 'package:flutter/material.dart';

class CustomBookDeatelsAppBar extends StatelessWidget {
  const CustomBookDeatelsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        const Spacer(),
        const Icon(Icons.shopping_cart_outlined),
      ],
    );
  }
}
