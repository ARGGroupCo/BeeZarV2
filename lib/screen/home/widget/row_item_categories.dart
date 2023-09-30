import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowItemCategories extends StatelessWidget {
  const RowItemCategories({
    super.key,
    required this.list,
  });
  final List<Widget> list;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    Color color;
    List<BoxShadow> shadow;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 8,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GetBuilder<HomeController>(
              init: homeController,
              builder: (controller) {
                if (controller.categore != null &&
                    index != controller.categore) {
                  color = Colors.transparent;
                  shadow = const [];
                } else {
                  color = ColorManager.white;
                  shadow = const [
                    BoxShadow(
                      color: ColorManager.litePrimaryColor,
                      offset: Offset(1, 2),
                      blurStyle: BlurStyle.normal,
                      blurRadius: 1,
                    )
                  ];
                }
                return InkWell(
                  onTap: () {
                    controller.cheangeCategory(index);
                  },
                  child: Container(
                      margin: const EdgeInsets.only(
                          left: 10, top: 5, bottom: 5, right: 5),
                      padding: const EdgeInsets.all(5),
                      height: MediaQuery.sizeOf(context).height / 8,
                      width: MediaQuery.sizeOf(context).height / 8 - 20,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: shadow,
                      ),
                      child: list[index]),
                );
              });
        },
      ),
    );
  }
}
