import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Future<dynamic> conttactWithUser() {
  return Get.dialog(
    AlertDialog(
      backgroundColor: ColorManager.primaryColor,
      elevation: 3,
      insetPadding: const EdgeInsets.all(30),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "طرق التواصل",
            style: FontDef.w700S24Cw,
          ),
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.close,
                color: ColorManager.white,
              ))
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              onPressed: () async {
                if (await canLaunchUrl(Uri.parse("tel:+963956108642"))) {
                  launchUrl(Uri.parse("tel:0963956108642"));
                }
              },
              child: const Text("اتصال هاتفي")),
          ElevatedButton(
              onPressed: () async {
                if (await canLaunchUrl(
                    Uri.parse("whatsapp://send?phone=+963956108642"))) {
                  launchUrl(Uri.parse("whatsapp://send?phone=+963956108642"));
                } else {
                  launchUrl(Uri.parse("https://wa.me/+963956108642"));
                }
              },
              child: const Text("وتس اب")),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Get.back(),
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(ColorManager.white)),
          child: const Text(
            "الغاء",
            style: FontDef.w600S17Cb,
          ),
        )
      ],
    ),
  );
}
