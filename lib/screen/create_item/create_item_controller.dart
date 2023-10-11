import 'package:beezer_v2/model/gategory_model.dart';
import 'package:beezer_v2/model/sub_gategory_model.dart';
import 'package:beezer_v2/screen/create_item/create_item_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateItemController extends GetxController {
  CreateItemService service = CreateItemService();
  List<TextEditingController> textFieldController =
      List.generate(5, (i) => TextEditingController());
  List<GategoryModel> cat = [];
  List<SubCategoryModel> sub = [];
  var catID = 0.obs;
  var subID = 0.obs;
  var catValue = "".obs;
  var subValue = "".obs;
  var catDroblist = ["cars", "varsss", "ksnbck"].obs;
  var subDroblist = ["cars", "varsss", "ksnbck"].obs;
  @override
  void onInit() async {
    cat = await service.getCategoryAndSub();
    catDroblist.value = List.generate(cat.length, (index) {
      return cat[index].name;
    });
    catValue.value = catDroblist[0];
    sub = await service.getSubCategory(0);
    subDroblist.value = List.generate(sub.length, (index) => sub[index].name);
    subValue.value = subDroblist[0];
    super.onInit();
  }

  Future<void> fillSubList(int id) async {}
  onChange1(String? newValue) {
    catValue.value = newValue!;
    catID.value = catDroblist.indexOf(newValue);
  }

  onChange2(String? newValue) {
    subValue.value = newValue!;
    subID.value = catDroblist.indexOf(newValue);
  }
}
