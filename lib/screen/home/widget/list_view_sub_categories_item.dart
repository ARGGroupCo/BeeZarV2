import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/widget/add_button_to_bascket.dart';
import 'package:beezer_v2/screen/home/widget/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewSubCategoriesItems extends StatelessWidget {
  const ListViewSubCategoriesItems({super.key, required this.list});
  final List list;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            //
            //
            //صلح خطأ الانديكس حط محلو معرف العنصر
            //
            //
            onTap: () => homeController.toItem(index),
            child: SizedBox(
              width: 300,
              child: Card(
                elevation: 10,
                color: ColorManager.whiteDark,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.all(15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                                elevation: 10,
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        FavoriteButton(press: () {}),
                                      ],
                                    ),
                                    Image.asset(
                                      "lib/assets/images/Mercedes Benz.png",
                                    ),
                                    // InkWell(
                                    //   onTap: () => Get.dialog(
                                    //     Image.asset(
                                    //       "lib/assets/images/Mercedes Benz.png",
                                    //       height:
                                    //           MediaQuery.sizeOf(context).height,
                                    //       width: MediaQuery.sizeOf(context).width,
                                    //     ),
                                    //   ),
                                    //   child: Image.asset(
                                    //       "lib/assets/images/Mercedes Benz.png"),
                                    // ),
                                  ],
                                )),
                            const Text(
                              "Mercedes Benz S550",
                              style: FontDef.w600S14Cb,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, right: 15, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AddButtomToBascket(press: () {}),
                            const Text(
                              "\$74.000",
                              style: FontDef.w600S14Cb,
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
