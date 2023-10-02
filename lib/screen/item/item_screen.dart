import 'package:beezer_v2/screen/item/widget/app_bar_item.dart';
import 'package:beezer_v2/screen/item/widget/item_info_and_buttom_scroll.dart';
import 'package:beezer_v2/screen/item/widget/page_builder_image.dart';
import 'package:beezer_v2/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarItem(),
      bottomNavigationBar: const BottomNavigationBarDef(),
      body: const Column(
        children: [
          PageBuilderImage(),
          ItemInfoAndButtomScroll(),
        ],
      ),
    );
  }
}
