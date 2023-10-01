import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/home_screen.dart';
import 'package:beezer_v2/screen/home/widget/list_sub_categories.dart';
import 'package:beezer_v2/screen/home/widget/list_view_sub_categories_item.dart';
import 'package:beezer_v2/screen/home/widget/row_item_home.dart';
import 'package:beezer_v2/screen/home/widget/row_show_all.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemShow extends StatelessWidget {
  const ItemShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GetBuilder<HomeController>(
      init: homeController,
      builder: (controller) {
        if (controller.categore == null) {
          return Column(
            children: [
              RowShowAll(press: () {}, text: "الأكثر شهرة"),
              RowItemHome(list: listfamest, sizeH: 160, sizeW: 125),
              RowShowAll(press: () {}, text: "شوهد مؤخراً"),
              RowItemHome(list: listLast, sizeH: 170, sizeW: 130),
            ],
          );
        } else {
          return Column(
            children: [
              ListSubCategories(
                  list: homeController.listCategory[homeController.categore!]),
              const ListViewSubCategoriesItems(list: [])
            ],
          );
        }
      },
    );
  }
}
