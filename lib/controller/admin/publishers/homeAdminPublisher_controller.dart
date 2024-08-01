import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:bookstoreapplication/core/functions/handingdatacontroller.dart';
import 'package:bookstoreapplication/core/services/services.dart';

import 'package:bookstoreapplication/data/model/itemsmodel.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/admin/datasource/remote/publishers/homeAdminPublisherData.dart';
import '../../../data/model/categoriersModel.dart';
import '../../../data/model/publisherModel.dart';


abstract class HomePublisherController extends SearchMixController {
  initialData();
  deleteServ(String servid,String imageId);
  getdataserves();
  goToEdit(PublisherModel servesModel);
  goTocat(List<CategoriersModel> servess, int selectedCat, String serid);
}

class HomePublisherAdminControllerImp extends HomePublisherController {
  MyServices myServices = Get.find();
  //late TextEditingController search;
  late String username;
  late String userid;
  late String lang;
  List<PublisherModel> serves = [];
  HomeAdminPublisherData homedata = HomeAdminPublisherData(Get.find());

  // List data = [];
  List categories = [];
  int? selectedCat;
  String? servID;

  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    // lang = myServices.sharedPreferences.getString("lang")!;
    // username = myServices.sharedPreferences.getString("username")!;
    // userid = myServices.sharedPreferences.getString("userid")!;
  }

  @override
  getdataserves() async {
    serves.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getData();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['data']) {
        serves.add(PublisherModel.fromJson(servpro));
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
    search = TextEditingController();
    // initialData();

    getdataserves();

    super.onInit();
  }

  @override
  deleteServ(String servid,String imageId) {
    var response = homedata.deleteDataPub(servid, imageId);
    serves.removeWhere((element) => element.publisherId == servid);

    update();
  }


  @override
  goTocat(servess, selectedCat, serid) {
    Get.toNamed(AppRoute.homePublisherAdminView, arguments: {
      "publisher": servess,
      "selectedcat": selectedCat,
      "pubid": serid,
      // "categories": catData,
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }

  @override
  goToEdit(PublisherModel servesModel) {
    Get.offNamed(AppRoute.homePublisherAdminEdit,
        arguments: {"publisher": servesModel});
  }

}

class SearchMixController extends GetxController {
  List<ItemsModel> listdata = [];

  StatusRequest statusRequest = StatusRequest.none;
  HomeAdminPublisherData homedata = HomeAdminPublisherData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}
