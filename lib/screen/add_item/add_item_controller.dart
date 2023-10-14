import 'dart:io';
import 'package:beezer_v2/model/add_item.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class AddItemController extends GetxController {
  RxList<DropdownMenuItem<int?>> cat = RxList<DropdownMenuItem<int?>>();
  RxMap<int, List<DropdownMenuItem<int?>>> sub =
      RxMap<int, List<DropdownMenuItem<int?>>>();
  RxList<File> imageFile = RxList<File>();
  RxInt choCat = (-1).obs;
  AddItem item = AddItem();

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

  Future<bool> getImages(List<String>? imgs) async {
    imageFile.clear();
    if (imgs != null) {
      for (var element in imgs) {
        http.Response response =
            await http.get(Uri.parse("${Hostting.imageItem}/$element"));
        if (response.statusCode == 200) {
          var dir = await getTemporaryDirectory();
          var filename = "${dir.path}/${element.split("/").last}";
          imageFile.add(File(filename));
          await imageFile.last.writeAsBytes(response.bodyBytes);
        }
      }
    }
    return true;
  }

  Future<bool> addItem() async {
    http.MultipartRequest request =
        http.MultipartRequest("post", Hostting.createItem);
    request.headers.addAll(Hostting().getHeader());
    request.fields['name'] = item.name!;
    request.fields['description'] = item.des!;
    request.fields['category_id'] = item.catId!.toString();
    request.fields['price'] = item.price!.toString();
    request.fields['address'] = item.address!;
    request.fields['sub_category_id'] = item.subCatID.toString();
    List<http.MultipartFile> files = [];
    for (File file in imageFile) {
      var f = await http.MultipartFile.fromPath('files[]', file.path);
      files.add(f);
    }
    request.files.addAll(files);
    var response = await request.send();
    if (response.statusCode == 200) {
      HomeController homeController = Get.find();
      await homeController.getAllItems(true);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteItem(int id) async {
    http.Response response = await http.delete(Hostting.deleteItem(id),
        headers: Hostting().getHeader());
    if (response.statusCode == 200) {
      HomeController homeController = Get.find();
      await homeController.getAllItems(true);
      return true;
    }
    return false;
  }

  Future<bool> updateItem() async {
    http.MultipartRequest request =
        http.MultipartRequest("post", Hostting.updateItem(item.id!));
    request.headers.addAll(Hostting().getHeader());
    request.fields["name"] = item.name!;
    request.fields["description"] = item.des!;
    request.fields["category_id"] = item.catId.toString();
    request.fields["sub_category_id"] = item.subCatID.toString();
    request.fields["price"] = item.price.toString();
    List<http.MultipartFile> files = [];
    for (File file in imageFile) {
      var f = await http.MultipartFile.fromPath('images[]', file.path);
      files.add(f);
    }
    request.files.addAll(files);
    var response = await request.send();
    if (response.statusCode == 200) {
      HomeController homeController = Get.find();
      await homeController.getAllItems(true);
      return true;
    } else {
      return false;
    }
  }
}
