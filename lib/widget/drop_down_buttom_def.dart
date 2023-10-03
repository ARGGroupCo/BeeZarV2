import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/widget/list_region.dart';
import 'package:flutter/material.dart';

class DropDownButtonDef extends StatefulWidget {
  const DropDownButtonDef({
    super.key,
  });

  @override
  State<DropDownButtonDef> createState() => _DropDownButtomDefState();
}

String? _val;

class _DropDownButtomDefState extends State<DropDownButtonDef> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      style: FontDef.w400S15Cb,
      value: _val,
      items: listRegion,
      onChanged: (value) => setState(() {
        _val = value;
      }),
    );
  }
}
