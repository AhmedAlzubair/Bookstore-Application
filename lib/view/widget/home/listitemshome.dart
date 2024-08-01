// import 'package:ecommercecourse/controller/home_controller.dart';
// import 'package:ecommercecourse/core/constant/color.dart';
// import 'package:ecommercecourse/linkapi.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../data/model/ItemsModel2.dart';

// class ListItemsHome extends GetView<HomeControllerImp> {
//   const ListItemsHome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeControllerImp>(
//       builder: (controller) => 
//     SizedBox(
//         height: 200,
//         child: ListView.builder(
//             itemCount: controller.itemss.length,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, i) {
//               return ItemsHome(
//                   itemsModel: controller.itemss[i]);
//             }),
//       ),
//     );
//   }
// }

// class ItemsHome extends GetView<HomeControllerImp> {
//   final ItemsModel2 itemsModel;
//   const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           margin: const EdgeInsets.symmetric(horizontal: 10),
//           child: Image.asset(
//             "${AppLink.imagestProduct}/${itemsModel.productImage}",
//             height: 100,
//             width: 150,
//             //fit: BoxFit.fill,
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//               color: AppColor.black.withOpacity(0.3),
//               borderRadius: BorderRadius.circular(20)),
//           height: 120,
//           width: 200,
//         ),
//         Positioned(
//             left: 10,
//             child: Container(
              
//               child: Text(
//                 softWrap: true,
//                 maxLines: 2,
//                 overflow:TextOverflow.clip ,
//                 "${itemsModel.productName}",
//                 style: const TextStyle(
//                     color: Colors.white,
//                     // fontWeight: FontWeight.bold,
//                     fontSize: 13),
//               ),
//             ))
//       ],
//     );
//   }
// }
