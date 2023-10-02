import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/item/widget/cottact_with_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

class ConttactButtomAndFavorite extends StatelessWidget {
  const ConttactButtomAndFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () => conttactWithUser(),
            style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(5),
                fixedSize: MaterialStatePropertyAll(Size(250, 50)),
                backgroundColor:
                    MaterialStatePropertyAll(ColorManager.primaryColor)),
            child: const Text("إجراء اتصال", style: FontDef.w600S20Cw),
          ),
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(ColorManager.liteGrayText),
              fixedSize: MaterialStatePropertyAll(Size(50, 50)),
              elevation: MaterialStatePropertyAll(5),
            ),
            child: const Icon(Icons.favorite_border_outlined,
                color: ColorManager.primaryColor),
          )
        ],
      ),
    );
  }
}
