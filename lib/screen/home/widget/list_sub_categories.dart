import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSubCategories extends StatelessWidget {
  const ListSubCategories({
    super.key,
    required this.gategory,
  });
  final String gategory;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeController.listSubCategory[gategory]!.length,
        itemBuilder: (context, index) {
          bool cho = false;
          if (homeController.listSubCategory[gategory]![index].name ==
              homeController.subCategory) {
            cho = true;
          } else {
            cho = false;
          }
          return InkWell(
            onTap: () => homeController.cheangeSubCategory(
                homeController.listSubCategory[gategory]![index].name),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: GetBuilder<HomeController>(
                  init: homeController,
                  builder: (controller) {
                    if (gategory.length > 1) {
                      return Column(
                        children: [
                          Text(
                            homeController
                                .listSubCategory[gategory]![index].name,
                            style: !cho ? FontDef.w400S16Cg : FontDef.w400S16Cb,
                          ),
                          Visibility(
                            visible: cho,
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: ColorManager.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Row();
                    }
                  }),
            ),
          );
        },
      ),
    );
  }
}
