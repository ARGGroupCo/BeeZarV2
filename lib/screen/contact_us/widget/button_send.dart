import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';

class ButtonSend extends StatelessWidget {
  const ButtonSend({super.key, required this.press});
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: press,
        style: const ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size(250, 40)),
            backgroundColor:
                MaterialStatePropertyAll(ColorManager.primaryColor)),
        child: const Text("ارسال"),
      ),
    );
  }
}
