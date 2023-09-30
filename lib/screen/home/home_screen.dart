import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/home/widget/row_item_home.dart';
import 'package:beezer_v2/screen/home/widget/row_show_all.dart';
import 'package:beezer_v2/widget/app_bar_home.dart';
import 'package:beezer_v2/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHome(context),
      bottomNavigationBar: const BottomNavigationBarDef(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RowShowAll(press: () {}, text: "الأقسام"),
            RowItemHome(
              list: listCatogory,
              sizeH: MediaQuery.sizeOf(context).height / 8,
              sizeW: MediaQuery.sizeOf(context).height / 8 - 20,
            ),
            RowShowAll(press: () {}, text: "الأكثر شهرة"),
            RowItemHome(
              list: listfamest,
              sizeH: MediaQuery.sizeOf(context).height / 5,
              sizeW: MediaQuery.sizeOf(context).height / 5 - 40,
            ),
            RowShowAll(press: () {}, text: "شوهد مؤخراً"),
            RowItemHome(
              list: listLast,
              sizeH: MediaQuery.sizeOf(context).height / 4.5,
              sizeW: MediaQuery.sizeOf(context).height / 4.5 - 50,
            ),
          ],
        ),
      ),
    );
  }
}

//data for test
List<Widget> listCatogory = [
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    //list widget
    children: [
      Image.asset("lib/assets/images/Red-Ford-Mustang-PNG-HD 1.png"),
      const Text(
        "Cars",
        style: FontDef.w600S9Cb,
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    //list widget
    children: [
      Image.asset("lib/assets/images/pngwing 4.png"),
      const Text(
        "Smart phones",
        style: FontDef.w600S9Cb,
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    //list widget
    children: [
      Image.asset("lib/assets/images/sofa.png"),
      const Text(
        "Furniture",
        style: FontDef.w600S9Cb,
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    //list widget
    children: [
      Image.asset("lib/assets/images/My project (3) 1.png"),
      const Text(
        "Real estate",
        style: FontDef.w600S9Cb,
      ),
    ],
  ),
];

List<Widget> listfamest = [
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    //list widget
    children: [
      SizedBox(
        child: Image.asset(
          "lib/assets/images/a22ea42fda7aab44653998941f92f93a 1.png",
          height: 90,
          width: 70,
        ),
      ),
      const Text(
        "Huawei P30 6.1 inches ",
        style: FontDef.w500S11Cb,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "650\$",
            style: FontDef.w500S13Cb,
          ),
        ],
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    //list widget
    children: [
      Image.asset(
        "lib/assets/images/353b16b37a8aacde614934249e14b511 1.png",
        height: 90,
        width: 70,
      ),
      const Text(
        "Samsung Galaxy S23+",
        style: FontDef.w500S11Cb,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "800\$",
            style: FontDef.w500S13Cb,
          ),
        ],
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    //list widget
    children: [
      Image.asset(
        "lib/assets/images/a22ea42fda7aab44653998941f92f93a 1.png",
        height: 90,
        width: 70,
      ),
      const Text(
        "Huawei P30 6.1 inches ",
        style: FontDef.w500S11Cb,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "700\$",
            style: FontDef.w500S13Cb,
          ),
        ],
      ),
    ],
  ),
];

List<Widget> listLast = [
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    //list widget
    children: [
      Image.asset(
        "lib/assets/images/unsplash_jTCLppdwSEc.png",
        height: 100,
        width: 80,
      ),
      const Text(
        "Resedential ",
        style: FontDef.w500S11Cb,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "8400\$",
            style: FontDef.w500S13Cb,
          ),
        ],
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    //list widget
    children: [
      Image.asset(
        "lib/assets/images/product-3.png",
        height: 100,
        width: 80,
      ),
      const Text(
        "Ergonomic Chair",
        style: FontDef.w500S11Cb,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "350\$",
            style: FontDef.w500S13Cb,
          ),
        ],
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    //list widget
    children: [
      Image.asset(
        "lib/assets/images/purepng 1.png",
        height: 100,
        width: 90,
      ),
      const Text(
        "Volkswagen T-prime",
        style: FontDef.w500S11Cb,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "5000\$",
            style: FontDef.w500S13Cb,
          ),
        ],
      ),
    ],
  ),
];
//data for test