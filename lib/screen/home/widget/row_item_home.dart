import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';

class RowItemHome extends StatelessWidget {
  const RowItemHome({
    super.key,
    required this.sizeH,
    required this.list,
    required this.sizeW,
  });
  final double sizeH;
  final double sizeW;
  final List<Widget> list;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeH,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
              margin:
                  const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
              padding: const EdgeInsets.all(5),
              height: sizeH,
              width: sizeW,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: ColorManager.litePrimaryColor,
                    offset: Offset(1, 2),
                    blurStyle: BlurStyle.normal,
                    blurRadius: 1,
                  )
                ],
              ),
              child: list[index]);
        },
      ),
    );
  }
}
