import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';

AppBar appBarItem() {
  return AppBar(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    elevation: 0,
    leading: const Icon(
      Icons.arrow_back,
      color: ColorManager.black,
    ),
    title: Image.asset("lib/assets/images/logoo 1.png", fit: BoxFit.fill),
  );
}
