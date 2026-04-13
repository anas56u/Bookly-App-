import 'package:flutter/material.dart';

class Searchviewbody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Search for books',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            
          ),
        )
      ],
    );
    }
}
