import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:bookstoreapplication/core/functions/handingdatacontroller.dart';
import 'package:bookstoreapplication/core/services/services.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/admin/datasource/remote/Categories/homeAdminCategoriesData.dart';
import '../../../data/admin/datasource/remote/Products/homeAdminProductsData.dart';
import '../../../data/admin/datasource/remote/publishers/homeAdminPublisherData.dart';
import '../../../data/model/bookModel.dart';
import '../../../data/model/categoriersModel.dart';
import '../../../data/model/publisherModel.dart';

class HomeBooksControllerImp extends SearchMixController {
  MyServices myServices = Get.find();
  //late TextEditingController search;

  List<BookModel> proData = [];
  List<CategoriersModel> serves = [];
  List<PublisherModel> pubData = [];
  HomeAdminProductsData homedata = HomeAdminProductsData(Get.find());

  initialData() {
    // myServices.sharedPreferences.clear() ;
    // lang = myServices.sharedPreferences.getString("lang")!;
    // username = myServices.sharedPreferences.getString("username")!;
    // userid = myServices.sharedPreferences.getString("userid")!;
  }
  getdataPub() async {
    pubData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getDataPub();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['data']) {
        pubData.add(PublisherModel.fromJson(servpro));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    //update();
    //}
    update();
  }

  getdatapro() async {
    proData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getData();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List books = response['data'];
      // for (Map servpro in response['data']) {
      //   proData.add(BookModel.fromJson(servpro));
      // }
      proData.addAll(books.map((e) => BookModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    //update();
    //}
    update();
  }

  getdatacat() async {
    serves.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getDataCat();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['data']) {
        serves.add(CategoriersModel.fromJson(servpro));
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
    // getdataserves();
    getdataPub();
    getdatacat();
    getdatapro();

   

    super.onInit();
  }

  deletepro(String servid, String imageold) {
    var response = homedata.deleteData(servid, imageold);
    proData.removeWhere((element) => element.bookId == servid);

    update();
  }

  goToEdit(BookModel servesModel) {
    Get.toNamed(AppRoute.homeProductsAdminEdit, arguments: {
      "book": servesModel,
      "Catgories": serves,
      "Publishers": pubData
    });
  }

  goToAdd() {
    Get.toNamed(AppRoute.homeProductsAdminAdd,
        arguments: {"Catgories": serves, "Publishers": pubData});
  }
}

class SearchMixController extends GetxController {
  List<BookModel> listdata = [];

  StatusRequest statusRequest = StatusRequest.none;
  HomeAdminProductsData homedata = HomeAdminProductsData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => BookModel.fromJson(e)));
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
