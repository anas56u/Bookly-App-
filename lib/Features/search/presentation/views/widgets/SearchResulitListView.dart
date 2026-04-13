import 'package:booklyapp/Features/home/preesentation/widgets/BestSellerListViewItem.dart';
import 'package:flutter/material.dart';

class SearchResulitListView extends StatelessWidget {
  const SearchResulitListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const BestSellerListViewItem(),
      ),
    );
  }
}