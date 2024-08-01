import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:bookstoreapplication/core/functions/handingdatacontroller.dart';
import 'package:bookstoreapplication/core/services/services.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/admin/datasource/remote/Categories/homeAdminCategoriesData.dart';
import '../../../data/admin/datasource/remote/Products/homeAdminProductsData.dart';
import '../../../data/admin/datasource/remote/auth/signupAdminData.dart';
import '../../../data/admin/datasource/remote/publishers/homeAdminPublisherData.dart';
import '../../../data/admin/datasource/remote/users/homeAdminUserData.dart';
import '../../../data/model/bookModel.dart';
import '../../../data/model/categoriersModel.dart';
import '../../../data/model/publisherModel.dart';
import '../../../data/model/userModel.dart';

class AdminViewUsercontrollerImp extends GetxController {
  MyServices myServices = Get.find();
  //late TextEditingController search;

  List<Users> userData = [];

   SignupAdminData signupData = SignupAdminData(Get.find());

  initialData() {
    // myServices.sharedPreferences.clear() ;
    // lang = myServices.sharedPreferences.getString("lang")!;
    // username = myServices.sharedPreferences.getString("username")!;
    // userid = myServices.sharedPreferences.getString("userid")!;
  }
  StatusRequest statusRequest = StatusRequest.none;
  getdatauser() async {
    userData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await signupData.getData();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['data']) {
        userData.add(Users.fromJson(servpro));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    //update();
    //}
    update();
  }

  @override
  void onInit() {
    // initialData();
    // getdataserves();

    getdatauser();

    super.onInit();
  }

  deleteuser(String userid) {
    var response = signupData.deletedata(userid);
    userData.removeWhere((element) => element.userId== userid);

    update();
  }

  goToEdit(Users userModel) {
    Get.toNamed(AppRoute.homeUsersAdminEdit, arguments: {
      "user": userModel

    });
  }

  // goToAdd() {
  //   Get.toNamed(AppRoute.homeProductsAdminAdd,
  //       arguments: {"Catgories": serves, "Publishers": pubData});
  // }
}
