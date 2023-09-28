import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

class RowRemmberMeAndForgetPassword extends StatelessWidget {
  const RowRemmberMeAndForgetPassword({
    super.key,
    required this.check,
    required this.pressBox,
    required this.pressForget,
  });
  final bool check;
  final void Function(bool?) pressBox;
  final void Function() pressForget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: check,
                activeColor: ColorManager.darkPrimaryColor,
                checkColor: ColorManager.white,
                onChanged: pressBox,
              ),
              const Text("تذكرني", style: FontDef.w700S12Cb),
            ],
          ),
          TextButton(
              onPressed: pressForget,
              child: const Text(
                "نسيت كلمة المرور؟",
                style: FontDef.w700S12Cb,
              ))
        ],
      ),
    );
  }
}
