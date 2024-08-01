// import 'package:ecommercecourse/core/constant/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../controller/admin/services/servesCategoriesControllerView.dart';
// import '../../../core/constant/color.dart';
// import '../../widget/admin/services/listServesCat.dart';


// class ServesCategoriesAdminView extends StatelessWidget {
//   const ServesCategoriesAdminView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(ServesCategoriesControllerImp());
//     return GetBuilder<ServesCategoriesControllerImp>(
//       builder: (controller) => Scaffold(
//         appBar: AppBar(
//             title: Text(
//           "48".tr,
//           style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.primaryColor),
//         )),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//           ListServesCategoriesAdmin(controller.catData),
           
            
            
//             ]),
//         ),
       
//         floatingActionButton: FloatingActionButton(
//            backgroundColor: AppColor.primaryColor,
//           onPressed: () {
//           Get.offNamed(AppRoute.homeCategoriesAdminAdd);
//         },
//         child: const Icon(Icons.add),
        
//        // child: ,
        
//         ),
//          floatingActionButtonLocation:
//                   FloatingActionButtonLocation.centerDocked,
//       ),
//     );
//   }
// }
