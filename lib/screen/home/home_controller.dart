import 'package:get/get.dart';

class HomeController extends GetxController {
  int? categore;
  void cheangeCategory(int? num) {
    categore = num;
    update();
  }
}
