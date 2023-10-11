import 'package:flutter/material.dart';

class CatDropdown extends StatelessWidget {
  const CatDropdown({
    super.key,
    required this.cat,
    required this.onChange,
    required this.type,
    required this.init,
  });
  final List<String> cat;
  final void Function(String?)? onChange;
  final String type;
  final String init;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black),
          color: Colors.white),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              type,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: DropdownButton(
              // isExpanded: true,
              value: (cat.isNotEmpty) ? init : "choose",
              focusColor: Colors.grey.shade100,
              dropdownColor: Colors.white,
              // icon: const Icon(Icons.keyboard_arrow_down),
              items: cat.map((String items) {
                return DropdownMenuItem(
                  alignment: Alignment.centerRight,
                  value: items,
                  child: Text(
                    items,
                    // textDirection: TextDirection.rtl,
                    style: const TextStyle(
                        fontSize: 20, fontFamily: 'ca1', color: Colors.black54),
                  ),
                );
              }).toList(),
              onChanged: onChange,
            ),
          ),
        ],
      ),
    );
  }
}
