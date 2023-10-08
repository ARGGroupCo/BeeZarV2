import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(30)),
      child: const Icon(
        Icons.add,
        color: ColorManager.white,
        size: 30,
      ),
    );
  }
}
