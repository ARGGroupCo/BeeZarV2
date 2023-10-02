import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/screen/item/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> imageDialog(
    BuildContext context, ItemController itemController) {
  return Get.dialog(
      SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height - 150,
        child: PageView.builder(
          controller: itemController.pageController,
          scrollDirection: Axis.horizontal,
          itemCount: itemController.listImage.length,
          itemBuilder: (context, index) {
            return Image.asset(
              itemController.listImage[index],
            );
          },
        ),
      ),
      transitionCurve: Curves.easeInCirc,
      barrierColor: ColorManager.primaryColor);
}
