import 'package:beezer_v2/model/item_model.dart';
import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddButtomToFavorite extends StatelessWidget {
  const AddButtomToFavorite({
    super.key,
    required this.item,
  });
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return InkWell(
      onTap: () async {
        var res = await homeController.addDeleteFavourite(item);
        if (!res) {
          Get.snackbar("خطأ", "خطأ ما قد حدث");
        }
      },
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 40,
              width: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: ColorManager.primaryColor,
              ),
              child: Center(
                child: Icon(
                  item.favorite
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  size: 30,
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
