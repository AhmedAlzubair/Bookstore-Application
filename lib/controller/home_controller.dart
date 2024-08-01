import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:bookstoreapplication/core/functions/handingdatacontroller.dart';
import 'package:bookstoreapplication/core/services/services.dart';
import 'package:bookstoreapplication/data/datasource/remote/home_data.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../data/Model/servesModel.dart';
import '../data/model/categoriersModel.dart';

abstract class HomeController extends SearchMixServeController {
  initialData();

  getdatacat();
  // goTocat(List<ServesModel> categories, int selectedCat, int categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  late String lang;
  List<CategoriersModel> catData = [];
  HomeData homedata = HomeData(Get.find());

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang")!;
  }

  @override
  getdatacat() async {
    catData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getData();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['data']) {
        catData.add(CategoriersModel.fromJson(servpro));
      }

      print("====================================");
      // print(catpro["1"]);
      print("====================================");
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
    initialData();

    getdatacat();

    super.onInit();
  }

  // @override
  goTocat(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }
}

class SearchMixServeController extends GetxController {
  List<CategoriersModel> listdata = [];

  StatusRequest statusRequest = StatusRequest.none;
  HomeData homedata = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => CategoriersModel.fromJson(e)));
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
