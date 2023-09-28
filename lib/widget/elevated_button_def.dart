import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

class ElevatedButtonDef extends StatelessWidget {
  const ElevatedButtonDef({
    super.key,
    required this.press,
    required this.text,
  });
  final String text;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        backgroundColor: ColorManager.primaryColor,
        maximumSize: Size(MediaQuery.sizeOf(context).width, 50),
        minimumSize: Size(MediaQuery.sizeOf(context).width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: FontDef.w700S16Cw,
      ),
    );
  }
}
