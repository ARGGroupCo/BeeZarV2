import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/item/item_controller.dart';
import 'package:beezer_v2/screen/item/widget/arrow_buttom.dart';
import 'package:beezer_v2/screen/item/widget/info_dialog.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemInfoAndButtomScroll extends StatelessWidget {
  const ItemInfoAndButtomScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ItemController itemController = Get.find();
    return GetBuilder<ItemController>(
        init: itemController,
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ArrowButtom(isleft: true, show: true),
              Column(
                children: [
                  const Text("Mercedes BenzS550", style: FontDef.w500S15Cb),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 50,
                    child: TextButton(
                      onPressed: () => infoDialog(),
                      child: const Text(
                        "The Mercedes-Benz S-Class enjoys a spot year after year solidly near the top of the automotive heap. It’s simply a top tier machine that epitomizes what drivers think of as the “luxury segment.”Read more....",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: FontDef.w400S14Cg,
                      ),
                    ),
                  ),
                  DotsIndicator(
                    reversed: false,
                    dotsCount: itemController.listImage.length,
                    position: itemController.pagenum,
                    decorator: DotsDecorator(
                      activeColor: ColorManager.primaryColor,
                      activeSize: const Size(18, 9),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ],
              ),
              const ArrowButtom(isleft: false, show: true),
            ],
          );
        });
  }
}
