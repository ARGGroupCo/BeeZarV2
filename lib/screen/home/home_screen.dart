import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/widget/app_bar_home.dart';
import 'package:beezer_v2/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHome(context),
      bottomNavigationBar: const BottomNavigationBarDef(),
    );
  }
}
