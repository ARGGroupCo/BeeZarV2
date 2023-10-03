import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/item/item_controller.dart';
import 'package:beezer_v2/screen/item/widget/image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageBuilderImage extends StatelessWidget {
  const PageBuilderImage({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    ItemController itemController = Get.find();
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height / 2.5,
      child: PageView.builder(
        onPageChanged: (value) {
          itemController.pagenum = value;
          itemController.update();
        },
        controller: itemController.pageController,
        scrollDirection: Axis.horizontal,
        padEnds: true,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () => imageDialog(context, itemController, images),
              child: Image.network("${Hostting.imageItem}/${images[index]}"));
        },
      ),
    );
  }
}
