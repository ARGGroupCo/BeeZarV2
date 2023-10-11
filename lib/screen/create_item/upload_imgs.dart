import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/create_item/widgets/ctm_button.dart';
import 'package:beezer_v2/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UplodImgs extends StatelessWidget {
  const UplodImgs({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarDef(),
      appBar: AppBar(
        toolbarHeight: size.height * 0.06,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(
              width: size.width * 0.55,
            ),
            const Text("إنشاء اعلان", style: FontDef.w700182Cb),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            onPressed: () => {Get.back()},
            icon: const Icon(Icons.arrow_back_ios_outlined,
                color: ColorManager.grayText),
          ),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: ColorManager.darkGrayIcon,
              )),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  children: [
                    const Text(
                      "من فضلك اختار صورة",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: size.width * 0.4,
                        height: size.width * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: ColorManager.primaryColor),
                        child: const Center(
                          child: Icon(
                            Icons.file_upload_outlined,
                            color: ColorManager.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.2,
          ),
          CtmButton(onTap: () {}, text: "حفظ الاعلان"),
        ],
      )),
    );
  }
}
