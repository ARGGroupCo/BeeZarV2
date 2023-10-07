import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/home/page/profile_edit_screen.dart';
import 'package:beezer_v2/screen/home/widget/app_bar_profile.dart';
import 'package:beezer_v2/screen/home/widget/profile_button.dart';
import 'package:beezer_v2/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarprofile(context),
      bottomNavigationBar: const BottomNavigationBarDef(),
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
                  const Text("UserName", style: FontDef.w700182Cb),
                  const Text("email@email.com", style: FontDef.w500152Cg),
                  const SizedBox(
                    height: 20,
                  ),
                  ProfileButton(
                    press: () => Get.to(const ProfileEditScreen()),
                    text: "تعديل الصفحة الشخصية",
                    icon: Icons.edit,
                  ),
                  ProfileButton(
                    press: () {},
                    text: "تواصل معنا",
                    icon: Icons.contact_mail_outlined,
                  ),
                  ProfileButton(
                    press: () {},
                    text: "شروط الاستخدام",
                    icon: Icons.policy,
                  ),
                  ProfileButton(
                    press: () {},
                    text: "تسجيل الخروج",
                    icon: Icons.logout,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
