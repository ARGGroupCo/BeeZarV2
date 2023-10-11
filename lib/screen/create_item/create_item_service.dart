import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/gategory_model.dart';
import '../../model/sub_gategory_model.dart';
import '../../res/hostting.dart';

class CreateItemService {

  Future<List<SubCategoryModel>> getSubCategory(int num) async {
    List<SubCategoryModel> listSub = [];
    http.Response responseSub = await http.get(Hostting.getSubCategory(num),
        headers: Hostting().getHeader());
    if (responseSub.statusCode == 200) {
      print(responseSub.body);
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
    List<GategoryModel> listGategoryModel=[];
    http.Response response =
    await http.get(Hostting.getCategory, headers: Hostting().getHeader());
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var element in body["categories"]) {
        var gate = GategoryModel.fromJson(element);
        listGategoryModel.add(gate);
      }
    }
    return listGategoryModel;
  }

}
