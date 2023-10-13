import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/screen/add_item/add_item_controller.dart';
import 'package:beezer_v2/screen/add_item/widget/appbar_add_item.dart';
import 'package:beezer_v2/screen/contact_us/widget/button_send.dart';
import 'package:beezer_v2/widget/row_number_screen_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddImageToItem extends StatelessWidget {
  const AddImageToItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAddItem(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const RowNumberScreenRegister(isScreenOne: false),
              const ImageViwer(),
              const RowAddAndDeleteImage(),
              const SizedBox(height: 40),
              ButtonSend(
                press: () {},
                hint: "إضافة",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageViwer extends StatelessWidget {
  const ImageViwer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 0.7);
    AddItemController addItemController = Get.find();
    return GetX<AddItemController>(
      init: addItemController,
      builder: (controller) => Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorManager.darkGrayIcon, width: 1)),
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: addItemController.imageFile.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    addItemController.imageFile[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            Visibility(
              visible: addItemController.imageFile.isEmpty,
              child: ButtonImage(
                color: ColorManager.primaryColor,
                icon: Icons.upload,
                press: () => addItemController.addImage(),
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowAddAndDeleteImage extends StatelessWidget {
  const RowAddAndDeleteImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddItemController addItemController = Get.find();
    return GetX<AddItemController>(
      init: addItemController,
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Visibility(
          visible: addItemController.imageFile.isNotEmpty,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonImage(
                color: ColorManager.primaryColor,
                icon: Icons.upload,
                press: () => addItemController.addImage(),
              ),
              ButtonImage(
                color: ColorManager.red,
                icon: Icons.delete,
                press: () => addItemController.deleteImage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonImage extends StatelessWidget {
  const ButtonImage({
    super.key,
    required this.icon,
    required this.press,
    required this.color,
    this.size,
  });
  final void Function() press;
  final IconData icon;
  final Color color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Center(
        child: Container(
          height: size ?? 50,
          width: size ?? 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            icon,
            color: ColorManager.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
