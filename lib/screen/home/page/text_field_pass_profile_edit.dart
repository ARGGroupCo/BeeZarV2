import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/validator_def.dart';
import 'package:flutter/material.dart';

class TextFormFielPasswordProfileEdit extends StatefulWidget {
  const TextFormFielPasswordProfileEdit({
    super.key,
    required this.label,
    required this.controller,
    required this.paddingTop,
  });
  final String label;
  final TextEditingController controller;
  final double paddingTop;

  @override
  State<TextFormFielPasswordProfileEdit> createState() =>
      _TextFormFielPasswordProfileEditState();
}

bool _show = false;

class _TextFormFielPasswordProfileEditState
    extends State<TextFormFielPasswordProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.paddingTop),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: !_show,
        controller: widget.controller,
        validator: (value) => ValidatorDef.validatorPassword(value),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.grayText, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.grayText, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.grayText, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          suffixIcon: InkWell(
            onTap: () => setState(() {
              _show = !_show;
            }),
            child: Icon(_show ? Icons.visibility_off : Icons.visibility,
                color: ColorManager.darkGrayText),
          ),
          label: Text(
            widget.label,
            style: FontDef.w400S14Cg,
          ),
        ),
      ),
    );
  }
}
