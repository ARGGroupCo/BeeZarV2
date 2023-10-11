import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';

class CtmButton extends StatelessWidget {
  const CtmButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final void Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: ColorManager.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
