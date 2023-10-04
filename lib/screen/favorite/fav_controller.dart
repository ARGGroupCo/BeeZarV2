import 'package:get/get.dart';

class FavController extends GetxController {
  int? fav;
  void cheangeFav(int? num) {
    fav = num;
    update();
  }
}
