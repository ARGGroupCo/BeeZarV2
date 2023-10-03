import 'dart:convert';
import 'package:beezer_v2/model/gategory_model.dart';
import 'package:beezer_v2/model/item_model.dart';
import 'package:beezer_v2/model/sub_gategory_model.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/item/item_screen.dart';
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

  void toItem(int id) {
    Get.to(ItemScreen(id: id));
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
    if (subCategory != -1) {
      itemModelShearch = itemModelShearch
          .where((element) => element.subCategoryId == subCategory)
          .toList();
    }
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

  Future<List<ItemModel>> getAllItems(bool update) async {
    if (itemModelAll.isEmpty || update) {
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
        return list;
      }
    }
    return List.empty();
  }
}
