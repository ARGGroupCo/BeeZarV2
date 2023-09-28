import 'package:beezer_v2/screen/auth/login/login_screen.dart';
import 'package:beezer_v2/widget/app_bar_auth.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:beezer_v2/widget/have_account.dart';
import 'package:beezer_v2/widget/text_form_field_def.dart';
import 'package:beezer_v2/widget/text_form_field_password_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
    TextEditingController rePassword = TextEditingController();
    return Scaffold(
      appBar: appBarAuth(
          () => Get.off(const LoginScreen()), "إعادة تعيين كلمة المرور"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              TextFormFielPassword(
                label: "إنشاء كلمة مرور جديدة",
                controller: password,
                paddingTop: 80,
              ),
              TextFormFielPassword(
                label: "تأكيد كلمة المرور",
                controller: rePassword,
                paddingTop: 20,
              ),
              ElevatedButtonDef(
                press: () {},
                text: "تإكيد",
                padding: 40,
              ),
              HaveAccount(
                  press: () => Get.off(const LoginScreen()),
                  text: "",
                  textPress: "العودة لتسجيل الدخول")
            ],
          ),
        ),
      ),
    );
  }
}
