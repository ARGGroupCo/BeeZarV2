import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

class AddButtomToBascket extends StatelessWidget {
  const AddButtomToBascket({
    super.key,
    required this.press,
  });
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 60,
                width: 75,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: ColorManager.primaryColor,
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: -4,
            right: 26,
            child: Center(
              child: Text(
                "+",
                style: FontDef.w700S40Cw,
              ),
            ),
          )
        ],
      ),
    );
  }
}
