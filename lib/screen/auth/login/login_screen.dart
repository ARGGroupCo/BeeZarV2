import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/validator_def.dart';
import 'package:beezer_v2/screen/auth/login/widget/row_divider_text_divider.dart';
import 'package:beezer_v2/screen/auth/login/widget/row_remmber_me_and_forget_password.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:flutter/material.dart';
import '../../../widget/text_form_field_def.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Center(
          child: SingleChildScrollView(
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
                      TextFormFieldDeF(
                        controller: password,
                        label: "كلمة المرور",
                        icon: Icons.remove_red_eye,
                        paddingTop: 10,
                        validator: (p0) {
                          return ValidatorDef.validatorPassword(p0);
                        },
                      ),
                      RowRemmberMeAndForgetPassword(
                        check: true,
                        pressBox: (value) {},
                        pressForget: () {},
                      ),
                      ElevatedButtonDef(
                        press: () {},
                        text: "تسجيل دخول",
                      ),
                      const RowDividerTextDivider(),
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
