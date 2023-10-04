import 'package:beezer_v2/model/item_model.dart';
import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/widget/add_button_to_bascket.dart';
import 'package:beezer_v2/widget/progress_home_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewSubCategoriesItems extends StatelessWidget {
  const ListViewSubCategoriesItems({super.key, required this.list});
  final List<ItemModel> list;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemCount: homeController.itemModelShearch.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () =>
                homeController.toItem(homeController.itemModelShearch[index]),
            child: SizedBox(
              width: 300,
              child: Card(
                elevation: 10,
                color: ColorManager.whiteDark,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.all(15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                                elevation: 10,
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "${Hostting.imageItem}/${list[index].images![0]}",
                                      placeholder: (context, url) =>
                                          const ProgressHomeRow(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      height: 200,
                                      width: 250,
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                )),
                            Text(
                              list[index].name,
                              style: FontDef.w600S14Cb,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, right: 15, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AddButtomToFavorite(press: () {}),
                            Text(
                              list[index].price.toString(),
                              style: FontDef.w600S14Cb,
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
