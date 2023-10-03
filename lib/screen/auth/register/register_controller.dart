
import 'package:beezer_v2/screen/auth/register/register_service.dart';
import 'package:get/get.dart';

import '../../../models/beezar_user.dart';



class SignUpController extends GetxController {
  RegisterService service =RegisterService();
  var keep = false;
  var name;
  var address;
  var phone;
  var email;
  var password;
  var SignUpStatuse = false;
  var message;
  String dropdownvalue = 'حلب';

  Future<void> SignOnClick() async {
    User users = User(
        name: name,
        email: email,
        password: password,
        address: dropdownvalue,
        phone: phone);

    SignUpStatuse = await service.register(users);

    if (message is List) {
      String temp = '';
      for (String s in message) {
        temp += s + '\n';
        message = temp;
      }
    }
  }

  onChange(String? newValue) {
    dropdownvalue = newValue!;
    update();
  }
}
