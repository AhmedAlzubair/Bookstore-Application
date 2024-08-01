// import 'package:ecommercecourse/data/model/CategoriesModel2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../controller/admin/services/servesCategoriesControllerView.dart';
// import '../../../../core/constant/color.dart';
// import '../../../../core/functions/translatefatabase.dart';
// import '../../../../linkapi.dart';

// class ListServesCategoriesAdmin extends GetView<ServesCategoriesControllerImp> {
//   final List<CategoriersModel> cat;
//   //final CategoriersModel cat;
//  // final int indexserv;

//   const ListServesCategoriesAdmin(this.cat, {Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     //Get.put(HomeControllerImp());
//     return Container(
//         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: cat.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 0.7,
//           ),
//           itemBuilder: (context, index) => ListServesCategoriesAdminHome(
//             i: index,
//             categoriesModel: cat[index],
//           ),
//         ));
//   }
// }

// class ListServesCategoriesAdminHome extends GetView<ServesCategoriesControllerImp> {
//   final CategoriersModel categoriesModel;
//   final int i;
//   const ListServesCategoriesAdminHome(
//       {super.key, required this.categoriesModel, required this.i});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         //controller.goTocat(controller.serves, i, categoriesModel.servesId!);
//       },
//       child: Card(
//         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: Column(
//             //mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.network(
//                 "${AppLink.imagestcatss}/${categoriesModel.categoriersImage}",
//                 width: 200,
//                 height: 150,
//               ),
//               //const SizedBox(height: 20,),
//               // Text(categoriesModel.servesName!),
//               Text(
//                 "${translateDatabase(categoriesModel.categoriersNameAr, categoriesModel.categoriersName)}",
//                 style: const TextStyle(fontSize: 13, color: AppColor.black),
//               ),
//               // Expanded(
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //     children: [
//               //       IconButton(
//               //           icon: const Icon(Icons.delete_outline_outlined),
//               //           onPressed: () {
//               //             controller.deletecat(
//               //                 categoriesModel.categoriersId.toString(),
//               //                 categoriesModel.categoriersImage.toString());
//               //           }),
//               //       IconButton(
//               //           icon: const Icon(Icons.edit),
//               //           onPressed: () {
//               //             controller.goToEdit(categoriesModel);
//               //           }),
//               //     ],
//               //   ),
//               // )
          
//             ]),
//       ),
//     );
//   }
// }
