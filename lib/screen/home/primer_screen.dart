import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/page/Home.dart';
import 'package:beezer_v2/screen/home/page/fav_screen.dart';
import 'package:beezer_v2/widget/app_bar_home.dart';
import 'package:beezer_v2/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimerScreen extends StatelessWidget {
  const PrimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GetBuilder<HomeController>(
        init: homeController,
        builder: (controller) {
          return Scaffold(
            appBar: appBarHome(context),
            bottomNavigationBar: const BottomNavigationBarDef(),
            body: PageView.builder(
              controller: homeController.pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return page[index];
              },
            ),
          );
        });
  }
}

List<Widget> page = [
  const HomeScreen(),
  const FavScreen(),
  Container(),
  Container(),
];
