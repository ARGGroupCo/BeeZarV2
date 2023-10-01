import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/widget/drop_down_item_def.dart';
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
      items: [
        dropDownMenuItemDef(null, "حدد الموقع"),
        dropDownMenuItemDef("الرقة", "الرقة"),
        dropDownMenuItemDef("الطبقة", "الطبقة"),
        dropDownMenuItemDef("بو كمال", "بو كمال"),
        dropDownMenuItemDef("منبج", "منبج"),
        dropDownMenuItemDef("جرابلس", "جرابلس"),
        dropDownMenuItemDef("ادلب", "ادلب"),
        dropDownMenuItemDef("دمشق", "دمشق"),
        dropDownMenuItemDef("حلب", "حلب"),
        dropDownMenuItemDef("حمص", "حمص"),
        dropDownMenuItemDef("اللازقبة", "اللازقبة"),
        dropDownMenuItemDef("طرطوس", "طرطوس"),
        dropDownMenuItemDef("القامشلي", "القامشلي"),
        dropDownMenuItemDef("دير الزور", "دير الزور"),
        dropDownMenuItemDef("الحسكة", "الحسكة"),
        dropDownMenuItemDef("تدمر", "تدمر"),
        dropDownMenuItemDef("حماه", "حماه"),
        dropDownMenuItemDef("ريف دمشق", "ريف دمشق"),
        dropDownMenuItemDef("قنيطرة", "قنيطرة"),
        dropDownMenuItemDef("درعا", "درعا"),
      ],
      onChanged: (value) => setState(() {
        _val = value;
      }),
    );
  }
}
