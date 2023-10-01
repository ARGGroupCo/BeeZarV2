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
    } else {
      categore = num;
    }
    update();
  }

  void cheangeSubCategory(String sub) {
    subCategory = sub;
    update();
  }
}
