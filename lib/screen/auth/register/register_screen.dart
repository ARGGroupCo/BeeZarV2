import 'package:beezer_v2/res/validator_def.dart';
import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:beezer_v2/screen/auth/login/login_screen.dart';
import 'package:beezer_v2/screen/auth/login/widget/row_divider_text_divider.dart';
import 'package:beezer_v2/screen/auth/otp/otp_screen.dart';
import 'package:beezer_v2/screen/auth/register/widget/appbar_register.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:beezer_v2/widget/google_facebook_icon.dart';
import 'package:beezer_v2/widget/have_account.dart';
import 'package:beezer_v2/widget/text_form_field_def.dart';
import 'package:beezer_v2/widget/text_form_field_password_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKay = GlobalKey<FormState>();
    AuthController authController = Get.find();
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
            key: formKay,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormFieldDeF(
                    label: "الإسم الكامل",
                    controller: name,
                    paddingTop: 10,
                    validator: (val) {
                      return ValidatorDef.validatorname(val);
                    }),
                TextFormFieldDeF(
                    label: "بريدك الإلكتروني",
                    controller: email,
                    paddingTop: 20,
                    validator: (val) {
                      return ValidatorDef.validatorEmail(val);
                    }),
                TextFormFieldDeF(
                    label: "رقم الجوال",
                    controller: phone,
                    paddingTop: 20,
                    keyboard: TextInputType.phone,
                    validator: (val) {
                      return ValidatorDef.validatorPhone(val);
                    }),
                TextFormFielPassword(
                  label: "كلمة المرور",
                  controller: password,
                  paddingTop: 20,
                ),
                TextFormFielPassword(
                  label: "تأكيد كلمة المرور",
                  controller: rePassword,
                  paddingTop: 20,
                ),
                ElevatedButtonDef(
                  press: () async {
                    if (formKay.currentState!.validate()) {
                      if (password.text == rePassword.text) {
                        var res = await authController.register(
                            name.text, email.text, phone.text, password.text);
                        if (res) {
                          Get.off(const OtpScreen());
                        } else {
                          Get.snackbar("خطأ",
                              "تم استخدام البريد الالكتروني مسبقاً او حدث خطأ ما الرجاء الاتصال بالمسوؤل");
                        }
                      } else {
                        Get.snackbar(
                            "خطأ", "لا يوجد تطابق بين كلمة المرور وتأكيدها");
                      }
                    } else {
                      Get.snackbar("خطأ", "الرجاء ادخال معلومات صحيحة");
                    }
                  },
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
