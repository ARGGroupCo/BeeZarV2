import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/widget/show_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    var list = homeController.itemModelAll
        .where((element) => element.favorite)
        .toList();
    return SizedBox(
      height: double.infinity,
      child: ShowListItemWidget(isFavorite: true, list: list),
    );
  }
}
