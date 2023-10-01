import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.press});
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      right: 5,
      child: IconButton(
        onPressed: press,
        icon: const Icon(Icons.favorite_border_outlined,
            color: ColorManager.darkGrayIcon),
      ),
    );
  }
}
