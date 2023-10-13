import 'dart:io';

import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddItemController extends GetxController {
  RxList<DropdownMenuItem<int?>> cat = RxList<DropdownMenuItem<int?>>();
  RxMap<int, List<DropdownMenuItem<int?>>> sub =
      RxMap<int, List<DropdownMenuItem<int?>>>();
  RxList<File> imageFile = RxList<File>();
  RxInt choCat = (-1).obs;

  @override
  void onInit() {
    addGategoryToList();
    super.onInit();
  }

  void addGategoryToList() {
    HomeController homeController = Get.find();
    cat.clear();
    sub.clear();
    sub.addAll({-1: []});
    for (var categ in homeController.listGategoryModel) {
      cat.add(DropdownMenuItem(value: categ.id, child: Text(categ.name)));
      sub.addAll({categ.id: []});
      for (var subgat in homeController.listSubCategory[categ.name]!) {
        if (subgat.id != -1) {
          sub[categ.id]!.add(
              DropdownMenuItem(value: subgat.id, child: Text(subgat.name)));
        }
      }
    }
    refresh();
  }

  void changecategory(int i) {
    choCat.value = i;
  }

  void addImage() async {
    final ImagePicker picker = ImagePicker();
    final response = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    if (response.isEmpty) {
      return;
    }
    for (var element in response) {
      imageFile.add(File(element.path));
    }
    refresh();
  }

  void deleteImage() {
    imageFile.clear();
  }
}
