import 'package:booklyapp/Features/home/preesentation/widgets/BestSellerListViewItem.dart';
import 'package:booklyapp/Features/search/presentation/views/widgets/SearchResulitListView.dart';
import 'package:booklyapp/Features/search/presentation/views/widgets/customSearchTextFild.dart';
import 'package:flutter/material.dart';

class Searchviewbody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(height: 20),
          Text(
            "Search Result",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),

          SearchResulitListView(),
        ],
      ),
    );
  }
}
