import 'dart:convert';
import 'package:beezer_v2/model/gategory_model.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/item/item_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  int? categore;
  String subCategory = "All";
  List<GategoryModel> listGategoryModel = [];
  List<List<String>> listCategory = [
    [
      "All",
      "BMW",
      "Mercedes",
      "Audi",
      "Gelle",
      "Hyundai",
      "Hound",
      "Chevrolet"
    ],
    ["All", "Nokia", "Samsung", "ْXiaomi", "Iifinix", "Sony"],
    ["All"],
    ["All"],
  ];

  void cheangeCategory(int? num) {
    if (categore == num) {
      categore = null;
      subCategory = "All";
    } else {
      categore = num;
    }
    update();
  }

  void cheangeSubCategory(String sub) {
    subCategory = sub;
    update();
  }

  void toItem(String id) {
    Get.to(ItemScreen(id: id));
  }

  Future<List<GategoryModel>> getCategory() async {
    if (listGategoryModel.isEmpty) {
      http.Response response =
          await http.get(Hostting.getCategory, headers: Hostting().getHeader());
      if (response.statusCode == 200) {
        List<GategoryModel> list = [];
        var body = jsonDecode(response.body);
        for (var element in body["categories"]) {
          list.add(GategoryModel.fromJson(element));
        }
        listGategoryModel = list;
      }
    }
    return listGategoryModel;
  }
}
