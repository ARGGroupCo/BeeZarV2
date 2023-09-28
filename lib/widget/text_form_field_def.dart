import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

class TextFormFieldDeF extends StatelessWidget {
  const TextFormFieldDeF({
    super.key,
    required this.label,
    required this.controller,
    required this.paddingTop,
    this.icon,
    this.validator,
    this.pressIcon,
  });
  final String label;
  final IconData? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double paddingTop;
  final void Function()? pressIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primaryColor, width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primaryColor, width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          suffixIcon: icon != null
              ? InkWell(
                  onTap: pressIcon,
                  child: Icon(icon, color: ColorManager.darkGrayText))
              : null,
          label: Text(
            label,
            style: FontDef.w400S14Cg,
          ),
        ),
      ),
    );
  }
}
