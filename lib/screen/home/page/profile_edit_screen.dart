import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/home/widget/drop_down_profile_edit.dart';
import 'package:beezer_v2/screen/home/widget/textfield_profile_edit.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController myName = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("email@email.com", style: FontDef.w500152Cg),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'الاسم',
                        style: FontDef.w600S17Cb,
                      )
                    ],
                  ),
                  TextFormFieldProfileEdit(
                    keyboard: TextInputType.text,
                    label: 'الاسم',
                    controller: myName,
                    paddingTop: 5,
                  ),
                  const Row(
                    children: [
                      Text(
                        'كلمة المرور',
                        style: FontDef.w600S17Cb,
                      )
                    ],
                  ),
                  TextFormFieldProfileEdit(
                    controller: password,
                    label: "كلمة المرور",
                    paddingTop: 5,
                    keyboard: TextInputType.text,
                  ),
                  const Row(
                    children: [
                      Text(
                        'رقم الجوال',
                        style: FontDef.w600S17Cb,
                      )
                    ],
                  ),
                  TextFormFieldProfileEdit(
                    keyboard: TextInputType.phone,
                    label: 'رقم الجوال',
                    controller: phone,
                    paddingTop: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'المدينة',
                        style: FontDef.w600S17Cb,
                      )
                    ],
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    DropdownButtonHideUnderline(
                        child: Container(
                      width: MediaQuery.of(context).size.width * 5,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: (BoxDecoration(
                          border: Border.all(color: ColorManager.grayText),
                          borderRadius: BorderRadius.circular(10))),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DropDownProfileEdit(),
                      ),
                    ))
                  ]),
                  const SizedBox(height: 40),
                  ElevatedButtonDef(
                    press: () {},
                    text: 'حفط التغييرات',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
