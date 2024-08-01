import 'package:dartz/dartz_unsafe.dart';
import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:bookstoreapplication/core/functions/handingdatacontroller.dart';
import 'package:bookstoreapplication/core/services/services.dart';

import 'package:bookstoreapplication/data/model/itemsmodel.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/admin/datasource/remote/Categories/homeAdminCategoriesData.dart';
import '../../../data/admin/datasource/remote/publishers/homeAdminPublisherData.dart';
import '../../../data/model/categoriersModel.dart';
import '../../../data/model/publisherModel.dart';


abstract class HomeCategoriesController extends SearchMixController {
  initialData();
  //getdata();
  // getcat(String servId);
  // getItem();
  deletecat(String servid, String imageold);
  getdatacat();

  goToEdit(CategoriersModel servesModel);

  goToItems(
      List<CategoriersModel> categories, int selectedCat, String categoryid);
}

class HomeCategoriesControllerImp extends HomeCategoriesController {
  MyServices myServices = Get.find();
  //late TextEditingController search;

  List<CategoriersModel> catData = [];
   
  HomeAdminCategoriesData homedata = HomeAdminCategoriesData(Get.find());
  Map catpro = {};

//  key => id items
//  Value => 1 OR 0

  setCatpro(id, val) {
    catpro[id] = val;
    update();
  }

  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    // lang = myServices.sharedPreferences.getString("lang")!;
    // username = myServices.sharedPreferences.getString("username")!;
    // userid = myServices.sharedPreferences.getString("userid")!;
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
    // initialData();
    getdatacat();

    super.onInit();
  }

  @override
  deletecat(String servid, String imageold) {
    var response = homedata.deleteData(servid, imageold);
    catData.removeWhere((element) => element.categoriersId == servid);

    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }



  @override
  goToEdit(CategoriersModel servesModel) {
    Get.offNamed(AppRoute.homeCategoriesAdminEdit,
        arguments: {"Categories": servesModel});
  }

//   @override
//   getItem() async {
//     statusRequest = StatusRequest.loading;
//     var response = await homedata.getDataSer();
//     print("=============================== Controller $response ");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       for (Map servpro in response['items']) {
//         itemss.add(ItemsModel2.fromJson(servpro));
//       }
//       // cat.forEach((element) {
//       //   if (element.categoriersServes == servId) {
//       //     catData.add(element);
//       //   }
//       // });
//     } else {
//       statusRequest = StatusRequest.failure;
//     }
//     // }
//     update();
//   }
// }
}

class SearchMixController extends GetxController {
  List<ItemsModel> listdata = [];

  StatusRequest statusRequest = StatusRequest.none;
  HomeAdminCategoriesData homedata = HomeAdminCategoriesData(Get.find());

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
