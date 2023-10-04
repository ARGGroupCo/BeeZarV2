import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/widget/progress_home_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowItemCategories extends StatelessWidget {
  const RowItemCategories({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    Color color;
    List<BoxShadow> shadow;

    return FutureBuilder(
        future: homeController.getCategoryAndSub(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ProgressHomeRow();
          }
          return SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GetBuilder<HomeController>(
                    init: homeController,
                    builder: (controller) {
                      if (controller.categore != null &&
                          controller.listGategoryModel[index].id !=
                              controller.categore) {
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
                      return InkWell(
                        onTap: () {
                          controller.cheangeCategory(
                              controller.listGategoryModel[index].id);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, top: 5, bottom: 5, right: 5),
                          padding: const EdgeInsets.all(5),
                          height: 100,
                          width: 85,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: shadow,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    '${Hostting.imageCategory}/${snapshot.data![index].image}',
                                placeholder: (context, url) =>
                                    const ProgressHomeRow(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                height: 50,
                                width: 50,
                              ),
                              Text(
                                snapshot.data![index].name,
                                style: FontDef.w600S9Cb,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          );
        });
  }
}
