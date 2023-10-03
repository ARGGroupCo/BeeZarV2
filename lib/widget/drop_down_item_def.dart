import 'package:flutter/material.dart';

DropdownMenuItem dropDownMenuItemDef(dynamic val, String text) {
  return DropdownMenuItem(
    value: val,
    child: Text(text),
  );
}
