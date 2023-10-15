import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  PageController pageController = PageController();
  RxInt pagenum = 0.obs;

  void changeimage(int val) {
    pagenum.value = val;
  }
}
