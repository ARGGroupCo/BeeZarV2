import 'dart:async';
import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:beezer_v2/screen/auth/login/login_screen.dart';
import 'package:beezer_v2/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

double _size = 0;
AuthController _authController = Get.find();

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      if (!mounted) {
        setState(() {
          _size == 0.4 ? _size = 1.0 : _size = 0.4;
        });
      }
    });
    return Scaffold(
      body: FutureBuilder(
        future: _authController.checkToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: _size,
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).width / 1.1,
                      width: MediaQuery.sizeOf(context).width / 1.1,
                      child: Image.asset("lib/assets/images/logoo 1.png",
                          fit: BoxFit.fill),
                    ),
                  ),
                  const Text("Developed by ©️ ARG Group Co.",
                      style: FontDef.w600S17Cb),
                ],
              ),
            );
          }
          Timer(const Duration(seconds: 1), () {
            if (_authController.checkUser!) {
              Get.off(const HomeScreen());
            } else {
              Get.off(const LoginScreen());
            }
          });
          return Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            color: ColorManager.primaryColor,
          );
        },
      ),
    );
  }
}
