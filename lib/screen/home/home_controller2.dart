import 'dart:convert';
import 'package:beezer_v2/model/gategory_model.dart';
import 'package:beezer_v2/model/item_model.dart';
import 'package:beezer_v2/model/sub_gategory_model.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/item/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  int? categore;
  int? subCategory;
  String? region;
  List<GategoryModel> listGategoryModel = [];
  Map<String, List<SubCategoryModel>> listSubCategory = {};
  List<ItemModel> itemModelAll = [];
  List<ItemModel> itemModelShearch = [];
  PageController pageController = PageController();
  List<String> listDropDownSearch = [];
  int pageNumber = 0;

  @override
  void onInit() async {
    await getCategoryAndSub();
    await getAllItems(false);
    super.onInit();
  }

  void cheangePage(int number) {
    pageNumber = number;
    pageController.jumpToPage(number);
    update();
  }

  void cheangeCategory(int? num) {
    if (categore == num) {
      categore = null;
      subCategory = -1;
    } else {
      categore = num;
      subCategory = -1;
    }
    searchItem();
    update();
  }

  void cheangeSubCategory(int? sub) {
    subCategory = sub;
    searchItem();
    update();
  }

  void toItem(ItemModel itemModel) {
    Get.to(ItemScreen(item: itemModel));
  }

  void searchItem() {
    itemModelShearch = itemModelAll;
    if (region != null) {
      itemModelShearch =
          itemModelAll.where((element) => element.address == region).toList();
    }
    if (categore != null) {
      itemModelShearch = itemModelShearch
          .where((element) => element.categoryId == categore)
          .toList();
    }
    if (subCategory != -1 && subCategory != null) {
      itemModelShearch = itemModelShearch
          .where((element) => element.subCategoryId == subCategory)
          .toList();
    }
    update();
  }

  Future<List<ItemModel>> getMyItem() async {
    return [];
  }

  Future<List<SubCategoryModel>> getSubCategory(int num) async {
    List<SubCategoryModel> listSub = [];
    http.Response responseSub = await http.get(Hostting.getSubCategory(num),
        headers: Hostting().getHeader());
    if (responseSub.statusCode == 200) {
      var bodySub = jsonDecode(responseSub.body);
      listSub.add(
          SubCategoryModel(iamge: null, id: -1, name: "الكل", categoryId: num));
      for (var element in bodySub["subcategories"]) {
        var sub = SubCategoryModel.fromJson(element);
        listSub.add(sub);
      }
    }
    return listSub;
  }

  Future<List<GategoryModel>> getCategoryAndSub() async {
    if (listGategoryModel.isEmpty) {
      http.Response response =
          await http.get(Hostting.getCategory, headers: Hostting().getHeader());
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        for (var element in body["categories"]) {
          var gate = GategoryModel.fromJson(element);
          listGategoryModel.add(gate);
          var sub = await getSubCategory(gate.id);
          listSubCategory.addIf(
            !listSubCategory.containsKey(gate.name),
            gate.name,
            sub,
          );
        }
      }
    }
    return listGategoryModel;
  }

  Future<List<ItemModel>> getFavourite(ItemModel? itemModel) async {
    if (itemModelAll.isNotEmpty) {
      if (itemModel == null) {
        http.Response response = await http.post(Hostting.getFavourite,
            headers: Hostting().getHeader());
        if (response.statusCode == 200) {
          var body = jsonDecode(response.body);
          if (body["favorite_items"] != null) {
            for (var element in body["favorite_items"]) {
              var it = itemModelAll
                  .where((item) => item.id == ItemModel.fromJson(element).id)
                  .firstOrNull;
              if (it != null) {
                var i = itemModelAll.indexOf(it);
                itemModelAll[i].favorite = true;
              }
            }
          }
        }
      } else {
        var i = itemModelAll.indexOf(itemModel);
        itemModelAll[i].favorite = !itemModelAll[i].favorite;
      }
    }
    return itemModelAll.where((element) => element.favorite).toList();
  }

  Future<List<ItemModel>> getAllItems(bool updateData) async {
    if (itemModelAll.isEmpty || updateData) {
      http.Response response =
          await http.get(Hostting.getItems, headers: Hostting().getHeader());
      if (response.statusCode == 200) {
        List<ItemModel> list = [];
        var body = jsonDecode(response.body);
        for (var element in body["items"]) {
          list.add(ItemModel.fromJson(element));
        }
        itemModelAll = list;
        itemModelShearch = list;
        await getFavourite(null);
        update();
        return list;
      }
    }
    return itemModelShearch;
  }

  Future<bool> addDeleteFavourite(ItemModel item) async {
    http.Response response = await http.post(
        Hostting.addDeleteFavourite(item.id),
        headers: Hostting().getHeader());
    if (response.statusCode == 200) {
      var i = itemModelAll.indexOf(item);
      itemModelAll[i].favorite = !itemModelAll[i].favorite;
      update();
      return true;
    }
    return false;
  }

  void buildListSearch() {
    for (var element in itemModelAll) {
      listDropDownSearch.add("${element.id} - الاسم:${element.name}");
    }
    update();
  }
}