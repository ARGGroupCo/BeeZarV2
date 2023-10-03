import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

AppBar appBarAuth(void Function() press, String text) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: press,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: ColorManager.black,
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            text,
            style: FontDef.w600S17Cb,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    elevation: 0,
  );
}
