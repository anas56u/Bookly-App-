import 'package:booklyapp/core/widgets/button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Button(
            borderradues: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            backgroundcolor: Colors.white,
            textcolor: Colors.black,
            text: '19.99€',
          ),
        ),Expanded(
          child: Button(
             borderradues: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            backgroundcolor: Color(0xffEF8262),
            textcolor: Colors.white,
            text: 'Free Preview',
          ),
        ),
      ],
    );
  }
}
