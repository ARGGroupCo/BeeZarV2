import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/validator_def.dart';
import 'package:beezer_v2/screen/auth/forgit_password/forget_password_screen.dart';
import 'package:beezer_v2/screen/auth/login/widget/row_divider_text_divider.dart';
import 'package:beezer_v2/screen/auth/login/widget/row_remmber_me_and_forget_password.dart';
import 'package:beezer_v2/screen/auth/login/widget/svg_bottom_bar.dart';
import 'package:beezer_v2/screen/auth/register/register_screen.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:beezer_v2/widget/google_facebook_icon.dart';
import 'package:beezer_v2/widget/have_account.dart';
import 'package:beezer_v2/widget/text_form_field_def.dart';
import 'package:beezer_v2/widget/text_form_field_password_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      bottomNavigationBar: const SVGBottomBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "تسجيل الدخول",
                  style: FontDef.w700S28CP,
                ),
                const Text(
                  "مرجباً بك في بيزار",
                  style: FontDef.w600S18Cg,
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormFieldDeF(
                        controller: email,
                        label: "البريد الإلكتروني",
                        paddingTop: 50,
                        validator: (p0) {
                          return ValidatorDef.validatorEmail(p0);
                        },
                      ),
                      TextFormFielPassword(
                        controller: password,
                        label: "كلمة المرور",
                        paddingTop: 25,
                      ),
                      RowRemmberMeAndForgetPassword(
                        check: true,
                        pressBox: (value) {},
                        pressForget: () =>
                            Get.off(const ForgetPasswordScreen()),
                      ),
                      ElevatedButtonDef(
                        press: () {},
                        text: "تسجيل دخول",
                      ),
                      const RowDividerTextDivider(),
                      const GoogleFacebookIcon(),
                      HaveAccount(
                        press: () => Get.off(const RegisterScreen()),
                        text: "ليس لديك حساب؟",
                        textPress: "إنشاء حساب",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
