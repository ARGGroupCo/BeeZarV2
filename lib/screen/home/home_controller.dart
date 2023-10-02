import 'package:beezer_v2/screen/item/item_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int? categore;
  String subCategory = "All";
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
}
