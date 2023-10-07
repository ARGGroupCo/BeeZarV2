import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar appBarFav(BuildContext context, String text) {
  HomeController homeController = Get.find();
  return AppBar(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    elevation: 0,
    title: Text(text, style: FontDef.w700182Cb),
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.all(10.0),
      child: IconButton(
          onPressed: () => homeController.cheangePage(0),
          icon: const Icon(Icons.arrow_back_ios_outlined,
              color: ColorManager.grayText)),
    ),
  );
}





// import 'package:beezer_v2/res/color_manager.dart';
// import 'package:beezer_v2/res/font_def.dart';
// import 'package:flutter/material.dart';

// AppBar appBarFav(BuildContext context) {
//   TextEditingController search = TextEditingController();
//   return AppBar(
//     toolbarHeight: 75,
//     backgroundColor: Colors.transparent,
//     shadowColor: Colors.transparent,
//     elevation: 0,
//     leading: Image.asset("lib/assets/images/logoo 1.png"),
//     title: Column(
//       children: [
//         SizedBox(
//           height: 25,
//           width: MediaQuery.sizeOf(context).width * 0.65,
//           child: TextField(
//             controller: search,
//             style: const TextStyle(fontSize: 10, height: 1),
//             decoration: const InputDecoration(
//               hintText: "بحث",
//               prefixIcon: Icon(Icons.search),
//               prefixIconColor: ColorManager.grayText,
//               isDense: true,
//               contentPadding: EdgeInsets.all(8),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: ColorManager.black, width: 1),
//                 borderRadius: BorderRadius.all(Radius.circular(5)),
//               ),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(color: ColorManager.black, width: 1),
//                 borderRadius: BorderRadius.all(Radius.circular(5)),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//     actions: [
//       IconButton(
//         onPressed: () {},
//         icon: const Stack(
//           children: [
//             Icon(Icons.notifications_none_outlined,
//                 color: ColorManager.grayText),
//             Icon(
//               Icons.brightness_1,
//               color: ColorManager.red,
//               size: 8,
//             )
//           ],
//         ),
//       ),
//     ],
//     bottom: const PreferredSize(
//       preferredSize: Size(200, 25),
//       child: Padding(
//         padding: EdgeInsets.only(left: 15, right: 15),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text("المفضلة", style: FontDef.w700182Cb),
//           ],
//         ),
//       ),
//     ),
//   );
// }
