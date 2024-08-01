import 'package:bookstoreapplication/core/class/statusrequest.dart';

import 'package:bookstoreapplication/core/functions/handingdatacontroller.dart';
import 'package:bookstoreapplication/core/services/services.dart';
import 'package:bookstoreapplication/data/datasource/remote/officer_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/shared/searchmixController.dart';
import '../data/model/bookModel.dart';

class OfficerControllerImp extends SearchMixController {
  OfficerData testData = OfficerData(Get.find());
  List<BookModel> itemsData = [];

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();
 goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }
  @override
  void onInit() {
    search = TextEditingController();
    getItems();

    super.onInit();
  }

  getItems() async {
    itemsData.clear();

    statusRequest = StatusRequest.loading;
    update();
    var response = await testData.getDataOfficer();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        for (Map servpro in response['data']) {
          itemsData.add(BookModel.fromJson(servpro));
        }
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    // End
    //}
    update();
  }
}


























// class FavoriteController extends GetxController {
//   Map isFavorite = {};

//   setFavorite(id, val) {
//     isFavorite[id] = val;
//     print(isFavorite[id]);
//     update();
//   }
// }
