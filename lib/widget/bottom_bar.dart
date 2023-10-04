import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarDef extends StatefulWidget {
  const BottomNavigationBarDef({
    super.key,
  });

  @override
  State<BottomNavigationBarDef> createState() => _BottomNavigationBarDefState();
}

int _check = 1;

class _BottomNavigationBarDefState extends State<BottomNavigationBarDef> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();
    return Container(
      color: const Color.fromARGB(10, 0, 0, 0),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButtomBarDef(
            icon: Icons.home_outlined,
            order: 1,
            check: _check,
            press: () => setState(() {
              _check = 1;
              homeController.pageController.jumpTo(0);
            }),
          ),
          IconButtomBarDef(
            icon: Icons.shopping_bag_outlined,
            order: 2,
            check: _check,
            press: () => setState(() {
              _check = 2;
              homeController.pageController.jumpTo(1);
            }),
          ),
          IconButtomBarDef(
            icon: Icons.favorite_border,
            order: 3,
            check: _check,
            press: () => setState(() {
              _check = 3;
              homeController.pageController.jumpTo(3);
            }),
          ),
          IconButtomBarDef(
            icon: Icons.person_outline_outlined,
            order: 4,
            check: _check,
            press: () => setState(() {
              _check = 4;
              homeController.pageController.jumpTo(4);
            }),
          ),
        ],
      ),
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
