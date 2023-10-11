import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/create_item/create_item_controller.dart';
import 'package:beezer_v2/screen/create_item/upload_imgs.dart';
import 'package:beezer_v2/screen/create_item/widgets/beezar_textfield.dart';
import 'package:beezer_v2/screen/create_item/widgets/category_drobdown.dart';
import 'package:beezer_v2/screen/create_item/widgets/ctm_button.dart';
import 'package:beezer_v2/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateItem extends StatelessWidget {
  const CreateItem({super.key});

  @override
  Widget build(BuildContext context) {
    CreateItemController controller = Get.find();
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
            onPressed: () => {},
            icon: const Icon(Icons.arrow_back_ios_outlined,
                color: ColorManager.grayText),
          ),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          BeezarTextField(
            controller: controller.textFieldController[0],
            maxLines: 1,
            textInputType: TextInputType.text,
            validator: "الرجاءادخال اسم المنتج",
            hint: 'اسم المنتج',
          ),
          BeezarTextField(
            controller: controller.textFieldController[1],
            maxLines: 2,
            textInputType: TextInputType.text,
            validator: "الرجاءادخال الوصف",
            hint: 'الوصف',
          ),
          BeezarTextField(
            controller: controller.textFieldController[2],
            maxLines: 1,
            textInputType: TextInputType.text,
            validator: "الرجاءادخال السعر",
            hint: 'السعر',
          ),
          Obx(() {
            return Column(
              children: [
                CatDropdown(
                    cat: controller.catDroblist,
                    onChange: (value) => controller.onChange1(value),
                    type: 'التصنيف الرئيسي',
                    init: controller.catValue.value),
                SizedBox(
                  height: size.height * 0.015,
                ),
                CatDropdown(
                  cat: controller.subDroblist,
                  onChange: (value) => controller.onChange2(value),
                  type: 'التصنيف الثانوي',
                  init: controller.catDroblist[controller.catID.value],
                ),
              ],
            );
          }),
          CtmButton(
            onTap: () {
              Get.to(UplodImgs());
            },
            text: "متابعة",
          ),
        ],
      )),
    );
  }
}
