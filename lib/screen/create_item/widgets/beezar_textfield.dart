import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';

class BeezarTextField extends StatelessWidget {
  const BeezarTextField(
      {super.key,
      required this.controller,
      required this.maxLines,
      //   required this.onChanged,
      required this.textInputType,
      required this.validator,
      this.maxlegth,
      required this.hint});
  final TextEditingController controller;
  final int maxLines;
  // final Void Function(String) onChanged;
  final TextInputType textInputType;
  final String validator;
  final int? maxlegth;
  final String hint;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding:
          const EdgeInsets.only(left: 12, top: 8.0, right: 12, bottom: 8.0),
      child: SizedBox(
        // height: size.height*0.02,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("    $hint"),
            TextFormField(
              maxLength: maxlegth,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return validator;
                }
                return null;
              },
              keyboardType: textInputType,
              //    onChanged: onChanged,
              maxLines: maxLines,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                floatingLabelStyle: const TextStyle(
                    color: ColorManager.black, fontFamily: "ca1"),
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'ca1',
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: ColorManager.primaryColor,
                  ),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              controller: controller,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
          ],
        ),
      ),
    );
  }
}
