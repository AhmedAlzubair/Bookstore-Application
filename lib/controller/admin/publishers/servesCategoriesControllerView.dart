// import 'package:dartz/dartz_unsafe.dart';
// import 'package:ecommercecourse/core/class/statusrequest.dart';
// import 'package:ecommercecourse/core/constant/routes.dart';
// import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
// import 'package:ecommercecourse/core/services/services.dart';

// import 'package:ecommercecourse/data/model/itemsmodel.dart';
// //import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import '../../../data/admin/datasource/remote/services/homeAdminServiesData.dart';
// import '../../../data/model/CategoriesModel2.dart';
// import '../../../data/model/servesModel.dart';

// abstract class ServesCategoriesController extends SearchMixController {
//   initialData();

//   getdataserves(String servid);
// }

// class ServesCategoriesControllerImp extends ServesCategoriesController {
//   MyServices myServices = Get.find();

//   List<CategoriersModel> catData = [];
//   List<ServesModel> serves = [];
//   String? serid;
//   int? serselectid;
//   HomeAdminServiesData homedata = HomeAdminServiesData(Get.find());
//   Map catpro = {};

//   @override
//   initialData() {
//     // myServices.sharedPreferences.clear() ;
//     // lang = myServices.sharedPreferences.getString("lang")!;
//     // username = myServices.sharedPreferences.getString("username")!;
//     // userid = myServices.sharedPreferences.getString("userid")!;
//   }
//   @override
//   getdataserves(servid) async {
//     catData.clear();
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await homedata.getDataSerCat(servid);
//     print("=============================== Controller $response ");

//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       for (Map servpro in response['categories']) {
//         catData.add(CategoriersModel.fromJson(servpro));
//       }
//     } else {
//       statusRequest = StatusRequest.failure;
//     }
//     //update();
//     //}
//     update();
//   }

//   @override
//   void onInit() {
//     search = TextEditingController();
//     serves = Get.arguments["serves"];
//     serid = Get.arguments["serid"];
//     serselectid = Get.arguments["selectedcat"];

//     // initialData();
//     getdataserves(serid!);

//     super.onInit();
//   }

//   goToPageProductDetails(itemsModel) {
//     Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
//   }

//   goToEdit(CategoriersModel servesModel) {
//     Get.offNamed(AppRoute.homeCategoriesAdminEdit,
//         arguments: {"Categories": servesModel});
//   }
// }

// class SearchMixController extends GetxController {
//   List<ItemsModel> listdata = [];

//   StatusRequest statusRequest = StatusRequest.none;
//   HomeAdminServiesData homedata = HomeAdminServiesData(Get.find());

//   searchData() async {
//     statusRequest = StatusRequest.loading;
//     var response = await homedata.searchData(search!.text);
//     print("=============================== Controller $response ");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         listdata.clear();
//         List responsedata = response['data'];
//         listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   bool isSearch = false;
//   TextEditingController? search;
//   checkSearch(val) {
//     if (val == "") {
//       statusRequest = StatusRequest.none;
//       isSearch = false;
//     }
//     update();
//   }

//   onSearchItems() {
//     isSearch = true;
//     searchData();
//     update();
//   }
// }
