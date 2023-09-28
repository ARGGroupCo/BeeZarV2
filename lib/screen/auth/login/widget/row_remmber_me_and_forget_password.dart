import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

class RowRemmberMeAndForgetPassword extends StatefulWidget {
  const RowRemmberMeAndForgetPassword({
    super.key,
    required this.pressForget,
  });
  final void Function() pressForget;

  @override
  State<RowRemmberMeAndForgetPassword> createState() =>
      _RowRemmberMeAndForgetPasswordState();
}

bool _check = true;

class _RowRemmberMeAndForgetPasswordState
    extends State<RowRemmberMeAndForgetPassword> {
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
                value: _check,
                activeColor: ColorManager.darkPrimaryColor,
                checkColor: ColorManager.white,
                onChanged: (value) => setState(() {
                  _check = !_check;
                }),
              ),
              const Text("تذكرني", style: FontDef.w700S12Cb),
            ],
          ),
          TextButton(
              onPressed: widget.pressForget,
              child: const Text(
                "نسيت كلمة المرور؟",
                style: FontDef.w700S12Cb,
              ))
        ],
      ),
    );
  }
}
