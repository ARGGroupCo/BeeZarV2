import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/validator_def.dart';
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                activeColor: ColorManager.darkPrimaryColor,
                                checkColor: ColorManager.white,
                                onChanged: (value) {},
                              ),
                              const Text("تذكرني", style: FontDef.w700S12Cb),
                            ],
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "نسيت كلمة المرور؟",
                                style: FontDef.w700S12Cb,
                              ))
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: const BoxDecoration(
                          color: ColorManager.primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Center(child: Text("تسجيل الدخول")),
                      )
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
