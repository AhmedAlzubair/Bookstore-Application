
import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/functions/handingdatacontroller.dart';
import 'package:bookstoreapplication/core/services/services.dart';
import 'package:bookstoreapplication/data/datasource/remote/myfavorite_data.dart';
import 'package:bookstoreapplication/data/model/myfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/shared/searchmixController.dart';

class MyFavoriteController extends SearchMixController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];

   StatusRequest statusRequest=StatusRequest.none;

  MyServices myServices = Get.find();
  String? userid;

//  key => id items
//  Value => 1 OR 0

  getFData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(userid!) ;
    print("=============================== Controller $response ");
      //  for (Map favor in response['data']) {
      //     data.add(MyFavoriteModel.fromJson(favor));
      //   }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        //List responsedata = response['data'];
        // data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        // print("data");
        // print(data);
        for (Map favor in response['data']) {
          data.add(MyFavoriteModel.fromJson(favor));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteFromFavorite(String favroiteid) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    var response = favoriteData.deleteData(favroiteid);
    data.removeWhere((element) => element.favoriteId == favroiteid);
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
     userid = myServices.sharedPreferences.getString("userid")!;
    getFData();
    super.onInit();
  }
}
