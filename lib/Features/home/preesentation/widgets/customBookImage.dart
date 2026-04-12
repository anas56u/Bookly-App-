import 'package:booklyapp/Features/home/preesentation/widgets/custoumlistview_item.dart';
import 'package:flutter/material.dart';

class customBookImage extends StatelessWidget {
  const customBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return CustoumListViewItem();
          },
        ),
      ),
    );
  }
}
