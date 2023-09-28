import 'package:beezer_v2/screen/auth/login/login_screen.dart';
import 'package:beezer_v2/screen/auth/login/widget/row_divider_text_divider.dart';
import 'package:beezer_v2/screen/auth/register/widget/appbar_register.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:beezer_v2/widget/google_facebook_icon.dart';
import 'package:beezer_v2/widget/have_account.dart';
import 'package:beezer_v2/widget/text_form_field_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController rePassword = TextEditingController();
    return Scaffold(
      appBar: appBarRegister(context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormFieldDeF(
                  label: "الإسم الكامل",
                  controller: name,
                  paddingTop: 10,
                ),
                TextFormFieldDeF(
                  label: "بريدك الإلكتروني",
                  controller: email,
                  paddingTop: 20,
                ),
                TextFormFieldDeF(
                  label: "رقم الجوال",
                  controller: phone,
                  paddingTop: 20,
                  keyboard: TextInputType.phone,
                ),
                TextFormFieldDeF(
                  label: "كلمة المرور",
                  controller: password,
                  paddingTop: 20,
                  icon: Icons.remove_red_eye,
                  pressIcon: () {},
                ),
                TextFormFieldDeF(
                  label: "تأكيد كلمة المرور",
                  controller: rePassword,
                  paddingTop: 20,
                  icon: Icons.remove_red_eye,
                  pressIcon: () {},
                ),
                ElevatedButtonDef(
                  press: () {},
                  text: "إنشاء حساب",
                  padding: 20,
                ),
                const RowDividerTextDivider(),
                const GoogleFacebookIcon(),
                HaveAccount(
                  press: () => Get.off(const LoginScreen()),
                  text: "لديك حساب؟",
                  textPress: "سجل دخول",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
