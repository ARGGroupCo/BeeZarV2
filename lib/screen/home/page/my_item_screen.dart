import 'package:beezer_v2/model/item_model.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/home/widget/show_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyItemScreen extends StatelessWidget {
  const MyItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return FutureBuilder<List<ItemModel>>(
      future: homeController.getMyItem(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return SizedBox(
          height: double.infinity,
          child: ShowListItemWidget(isFavorite: false, list: snapshot.data!),
        );
      },
    );
  }
}
