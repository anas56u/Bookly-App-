import 'package:booklyapp/Features/home/preesentation/widgets/BestSellerListView.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/BestSellerListViewItem.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/FeaturedBookListeView.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/customApp_bar.dart';
import 'package:booklyapp/Features/home/preesentation/widgets/custoumlistview_item.dart';
import 'package:booklyapp/core/utlis/assets.dart';
import 'package:booklyapp/core/utlis/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homeviewbody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customApp_bar(),
            FeaturedBookListeView(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Text("Best Seller", style: TextStyles.sectionHeader),
            ),
            SizedBox(height: 20),
                   
        
        
          ],
        ),
        ),SliverFillRemaining(
          child:  BestSellerListView(),
        )
       
      ],
    );
  }
}

