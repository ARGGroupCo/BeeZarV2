import 'package:beezer_v2/model/register_user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  bool remmberMy = true;
  bool? checkUser;
  RegisterUserModel registerUserModel = RegisterUserModel();

  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  void changeRemmberMy() {
    remmberMy = !remmberMy;
    update();
  }

  Future<bool> login(String email, String password) async {
    return true;
  }

  Future<bool> register() async {
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

  Future<bool> checkToken() async {
    var storage = GetStorage();
    if (storage.read("Token") != null || storage.read("Token") != "") {
      //تعليمة فحص التوكن ثم فحص اذا صح الذهاب الى الصفحة الرئيسية وإلا الى تسجيل الدخول
      checkUser = false;
      return true;
    }
    return false;
  }
}
