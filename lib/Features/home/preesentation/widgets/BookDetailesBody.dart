import 'package:booklyapp/Features/home/preesentation/widgets/CustomBookDeatelsAppBar.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/custoumlistview_item.dart';
import 'package:flutter/material.dart';

class Bookdetailesbody extends StatelessWidget {
  const Bookdetailesbody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomBookDeatelsAppBar(),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*.15 ),
            child: CustoumListViewItem(),
          )
        ],
      ),
    );
  }
}

