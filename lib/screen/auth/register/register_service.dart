import 'dart:convert';
import 'package:beezer_v2/models/beezar_user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/server_config.dart';

class RegisterService {
  var url = Uri.parse(ServerConfig.DNS + ServerConfig.signup);
  var message;
  var error;
  var token;

  Future<bool> register(User user) async {
    var response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'name': user.name,
        'password': user.password,
        'email': user.email,
        'address': user.address,
        'phone': user.phone,
      },
    );
    print(url);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final sp=await SharedPreferences.getInstance();
      await  sp.setString('id', json.decode(response.body)["access_token"].toString());

      var jsonResponse = jsonDecode(response.body);
      // message=jsonResponse['success'];
      return true;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      //  message= jsonResponse['errors'];
      return false;
    } else if (response.statusCode == 500) {
      var jsonResponse = jsonDecode(response.body);
      //  message= jsonResponse['errors'];
      return false;
    } else {
      var jsonResponse = jsonDecode(response.body);
      // message= jsonResponse['errors'];
      return false;
    }
  }
}
