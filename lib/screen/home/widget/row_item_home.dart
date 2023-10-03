import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowItemHome extends StatelessWidget {
  const RowItemHome(
      {super.key,
      required this.sizeH,
      required this.sizeW,
      required this.future});
  final double sizeH;
  final double sizeW;
  final Future<List> future;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: sizeH,
              width: sizeW,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return SizedBox(
            height: sizeH,
            child: GetBuilder<HomeController>(
                init: homeController,
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.itemModelShearch.length > 25
                        ? 25
                        : controller.itemModelShearch.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => homeController
                            .toItem(homeController.itemModelShearch[index].id),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, top: 5, bottom: 5, right: 5),
                          padding: const EdgeInsets.all(5),
                          height: sizeH,
                          width: sizeW,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: ColorManager.litePrimaryColor,
                                offset: Offset(1, 2),
                                blurStyle: BlurStyle.normal,
                                blurRadius: 1,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //list widget
                            children: [
                              Image.network(
                                "${Hostting.imageItem}/${controller.itemModelShearch[index].images![0]}",
                                height: sizeH - 70,
                                width: sizeW - 30,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                controller.itemModelShearch[index].name,
                                style: FontDef.w500S11Cb,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.itemModelShearch[index].price
                                        .toString(),
                                    style: FontDef.w500S13Cb,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
          );
        });
  }
}
