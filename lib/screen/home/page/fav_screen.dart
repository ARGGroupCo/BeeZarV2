import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/favorite/fav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});
  @override
  Widget build(BuildContext context) {
    FavController favController = Get.put(FavController());
    // ignore: unused_local_variable
    Color color;
    // ignore: unused_local_variable
    List<BoxShadow> shadow;
    return SizedBox(
      height: double.infinity,
      child: ListView.builder(
        //
        //
        //
        //
        itemCount: 3,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return GetBuilder<FavController>(
              init: favController,
              builder: (controller) {
                if (controller.fav != null && index != controller.fav) {
                  color = Colors.transparent;
                  shadow = const [];
                } else {
                  color = ColorManager.white;
                  shadow = const [
                    BoxShadow(
                      color: ColorManager.litePrimaryColor,
                      offset: Offset(1, 2),
                      blurStyle: BlurStyle.normal,
                      blurRadius: 1,
                    )
                  ];
                }
                //
                //
                //
                //
                return listFav[index];
              });
        },
      ),
    );
  }
}

List<Widget> listFav = [
  Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
            padding: const EdgeInsets.all(5),
            height: 130,
            width: 150,
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
            child: Image.asset(
              "lib/assets/images/353b16b37a8aacde614934249e14b511 1.png",
              height: 90,
              width: 70,
            ),
          ),
          const Column(
            children: [
              Text(
                'Samsung G-S23+',
                style: FontDef.w500S12Cb,
              ),
              Text(
                "250.00 \$",
                style: FontDef.w700S12Cb,
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: ColorManager.primaryColor)),
                    child: const Icon(
                      Icons.clear,
                      color: ColorManager.primaryColor,
                      size: 20,
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_rounded,
                  color: ColorManager.darkGrayIcon,
                  size: 20,
                ),
              )
            ],
          ),
        ],
      ),
      const Divider(),
    ],
  ),
  Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
            padding: const EdgeInsets.all(5),
            height: 130,
            width: 150,
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
            child: Image.asset(
              "lib/assets/images/353b16b37a8aacde614934249e14b511 1.png",
              height: 90,
              width: 70,
            ),
          ),
          const Column(
            children: [
              Text(
                'Samsung G-S23+',
                style: FontDef.w500S12Cb,
              ),
              Text(
                "250.00 \$",
                style: FontDef.w700S12Cb,
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: ColorManager.primaryColor)),
                    child: const Icon(
                      Icons.clear,
                      color: ColorManager.primaryColor,
                      size: 20,
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_rounded,
                  color: ColorManager.darkGrayIcon,
                  size: 20,
                ),
              )
            ],
          ),
        ],
      ),
      const Divider(),
    ],
  ),
  Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
            padding: const EdgeInsets.all(5),
            height: 130,
            width: 150,
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
            child: Image.asset(
              "lib/assets/images/353b16b37a8aacde614934249e14b511 1.png",
              height: 90,
              width: 70,
            ),
          ),
          const Column(
            children: [
              Text(
                'Samsung G-S23+',
                style: FontDef.w500S12Cb,
              ),
              Text(
                "250.00 \$",
                style: FontDef.w700S12Cb,
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: ColorManager.primaryColor)),
                    child: const Icon(
                      Icons.clear,
                      color: ColorManager.primaryColor,
                      size: 20,
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_rounded,
                  color: ColorManager.darkGrayIcon,
                  size: 20,
                ),
              )
            ],
          ),
        ],
      ),
      const Divider(),
    ],
  ),
  Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
            padding: const EdgeInsets.all(5),
            height: 130,
            width: 150,
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
            child: Image.asset(
              "lib/assets/images/353b16b37a8aacde614934249e14b511 1.png",
              height: 90,
              width: 70,
            ),
          ),
          const Column(
            children: [
              Text(
                'Samsung G-S23+',
                style: FontDef.w500S12Cb,
              ),
              Text(
                "250.00 \$",
                style: FontDef.w700S12Cb,
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: ColorManager.primaryColor)),
                    child: const Icon(
                      Icons.clear,
                      color: ColorManager.primaryColor,
                      size: 20,
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_rounded,
                  color: ColorManager.darkGrayIcon,
                  size: 20,
                ),
              )
            ],
          ),
        ],
      ),
      const Divider(),
    ],
  ),
  Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
            padding: const EdgeInsets.all(5),
            height: 130,
            width: 150,
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
            child: Image.asset(
              "lib/assets/images/353b16b37a8aacde614934249e14b511 1.png",
              height: 90,
              width: 70,
            ),
          ),
          const Column(
            children: [
              Text(
                'Samsung G-S23+',
                style: FontDef.w500S12Cb,
              ),
              Text(
                "250.00 \$",
                style: FontDef.w700S12Cb,
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: ColorManager.primaryColor)),
                    child: const Icon(
                      Icons.clear,
                      color: ColorManager.primaryColor,
                      size: 20,
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_rounded,
                  color: ColorManager.darkGrayIcon,
                  size: 20,
                ),
              )
            ],
          ),
        ],
      ),
      const Divider(),
    ],
  ),
];
