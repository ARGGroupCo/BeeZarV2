import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/server_config.dart';
import '../../../models/beezar_user.dart';

class LoginService {
  var url = Uri.parse(ServerConfig.DNS + ServerConfig.login);
  var message;
  var error;
  var token;

  Future<bool> login(User user) async {

    try {
      var response = await http.post(url,
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'email': user.email,
          'password':user.password,
        },
      );
      print(response.statusCode);
      print(response.body);
      if(response.statusCode==200) {
        final sp=await SharedPreferences.getInstance();
        await  sp.setString('id', json.decode(response.body)["token"].toString());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('$e');
      return false;
    }


  }
}