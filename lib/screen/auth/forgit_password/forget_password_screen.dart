import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/widget/app_bar_auth.dart';
import 'package:beezer_v2/screen/auth/login/login_screen.dart';
import 'package:beezer_v2/screen/auth/otp/otp_screen.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:beezer_v2/widget/text_form_field_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    return Scaffold(
      appBar: appBarAuth(() => Get.off(const LoginScreen()), "العودة"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(
                "نسيت كلمة المرور؟",
                style: FontDef.w700S42CP,
              ),
              const Text(
                "ادخل بريدك الالكتروني لتتلقي رمزا لتوثيقة هنا حتي تتمكن من اعادة تعيين كلمة المرور ",
                style: FontDef.w500152Cg,
              ),
              TextFormFieldDeF(
                label: "أدخل بريدك الإكتروني",
                controller: email,
                paddingTop: 70,
              ),
              ElevatedButtonDef(
                press: () => Get.off(const OtpScreen()),
                text: "استمرار",
                padding: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
