import 'package:get/get.dart';

class AuthController extends GetxController {
  bool remmberMy = true;
  void changeRemmberMy() {
    remmberMy = !remmberMy;
    update();
  }

  Future<bool> login(String email, String password) async {
    return true;
  }

  Future<bool> register(
      String name, String mail, String phone, String password) async {
    return true;
  }

  Future<bool> forgetPassword(String email) async {
    return true;
  }

  Future<bool> sendOTP(String value) async {
    return true;
  }

  Future<bool> restPassword(String oldPassword, String newPassword) async {
    return true;
  }
}
