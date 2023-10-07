import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarDef extends StatelessWidget {
  const BottomNavigationBarDef({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GetX<HomeController>(
      init: homeController,
      builder: (controller) {
        return Container(
          color: const Color.fromARGB(10, 0, 0, 0),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButtomBarDef(
                icon: Icons.home_outlined,
                order: 0,
                check: controller.pageNumber.value,
                press: () => controller.cheangePage(0),
              ),
              IconButtomBarDef(
                icon: Icons.shopping_bag_outlined,
                order: 1,
                check: controller.pageNumber.value,
                press: () => controller.cheangePage(1),
              ),
              IconButtomBarDef(
                icon: Icons.favorite_border,
                order: 2,
                check: controller.pageNumber.value,
                press: () => controller.cheangePage(2),
              ),
              IconButtomBarDef(
                icon: Icons.person_outline_outlined,
                order: 3,
                check: controller.pageNumber.value,
                press: () => controller.cheangePage(3),
              ),
            ],
          ),
        );
      },
    );
  }
}

class IconButtomBarDef extends StatelessWidget {
  const IconButtomBarDef({
    super.key,
    required this.check,
    required this.icon,
    required this.order,
    required this.press,
  });
  final void Function() press;
  final IconData icon;
  final int order;
  final int check;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.only(bottom: 5, top: 5, left: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: order == check ? ColorManager.litePrimaryColor : null),
        child: Icon(icon,
            color: order == check
                ? ColorManager.darkPrimaryColor
                : ColorManager.darkGrayIcon,
            size: 30),
      ),
    );
  }
}
