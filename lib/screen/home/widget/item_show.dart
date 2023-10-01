import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/home_screen.dart';
import 'package:beezer_v2/screen/home/widget/add_button_to_bascket.dart';
import 'package:beezer_v2/screen/home/widget/favorite_button.dart';
import 'package:beezer_v2/screen/home/widget/list_sub_categories.dart';
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
              SizedBox(
                height: 350,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 350,
                      width: 300,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorManager.white,
                        boxShadow: const [
                          BoxShadow(
                              blurStyle: BlurStyle.inner,
                              offset: Offset(0, 0),
                              color: ColorManager.litePrimaryColor,
                              spreadRadius: 3),
                        ],
                      ),
                      child: Stack(children: [
                        FavoriteButton(press: () {}),
                        AddButtomToBascket(press: () {}),
                      ]),
                    );
                  },
                ),
              )
            ],
          );
        }
      },
    );
  }
}
