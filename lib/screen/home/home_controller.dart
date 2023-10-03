import 'dart:convert';
import 'package:beezer_v2/model/gategory_model.dart';
import 'package:beezer_v2/model/sub_gategory_model.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/item/item_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  String? categore;
  String subCategory = "الكل";
  List<GategoryModel> listGategoryModel = [];
  Map<String, List<SubCategoryModel>> listSubCategory = {};

  void cheangeCategory(String? num) {
    if (categore == num) {
      categore = null;
      subCategory = "الكل";
    } else {
      categore = num;
      subCategory = "الكل";
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
}
