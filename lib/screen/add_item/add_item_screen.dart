import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/add_item/add_image_to_item.dart';
import 'package:beezer_v2/screen/add_item/add_item_controller.dart';
import 'package:beezer_v2/screen/add_item/widget/appbar_add_item.dart';
import 'package:beezer_v2/screen/contact_us/widget/border_def.dart';
import 'package:beezer_v2/screen/contact_us/widget/button_send.dart';
import 'package:beezer_v2/widget/row_number_screen_register.dart';
import 'package:beezer_v2/widget/text_form_field_contact_us_and_add_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddItemController addItemController = Get.find();
    GlobalKey formKey = GlobalKey<FormState>();
    TextEditingController name = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController price = TextEditingController();
    int? category;
    // ignore: unused_local_variable
    int? sub;
    return Scaffold(
      appBar: appBarAddItem(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: GetX<AddItemController>(
            init: AddItemController(),
            builder: (controller) => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RowNumberScreenRegister(isScreenOne: true),
                  DropdownButtonFormField<int?>(
                    value: category,
                    decoration: borderDef(""),
                    items: addItemController.cat,
                    onChanged: (value) {
                      sub = null;
                      category = value;
                      addItemController.changecategory(value!);
                    },
                    hint: const Text("إختر التصنيف"),
                    style: FontDef.w400S14Cg,
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<int?>(
                    value: addItemController.choCat.value != -1
                        ? addItemController
                                    .sub[addItemController.choCat.value] !=
                                null
                            ? addItemController
                                .sub[addItemController.choCat.value]!
                                .first
                                .value
                            : null
                        : null,
                    decoration: borderDef(""),
                    items:
                        addItemController.sub[addItemController.choCat.value],
                    onChanged: (value) => sub = value,
                    hint: const Text("إختر التصنيف الفرعي"),
                    style: FontDef.w400S14Cg,
                  ),
                  TextFormFieldContactUsAndAddItem(
                    keyboard: TextInputType.text,
                    controller: name,
                    label: "اسم المادة",
                  ),
                  TextFormFieldContactUsAndAddItem(
                    keyboard: TextInputType.text,
                    controller: price,
                    label: "السعر",
                  ),
                  TextFormFieldContactUsAndAddItem(
                    keyboard: TextInputType.text,
                    controller: description,
                    label: "وصف المادة",
                    minLine: 5,
                  ),
                  const SizedBox(height: 40),
                  ButtonSend(
                    press: () => Get.to(const AddImageToItem()),
                    hint: "التالي",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
