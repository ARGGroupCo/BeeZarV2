import 'package:beezer_v2/res/color_manager.dart';
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
          Center(
            child: Container(
              height: 40,
              width: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: ColorManager.primaryColor,
              ),
              child: const Center(
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
