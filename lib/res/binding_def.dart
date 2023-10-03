import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:get/get.dart';

class BindingDef implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}
