
import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:bookstoreapplication/core/functions/handingdatacontroller.dart';
import 'package:bookstoreapplication/core/services/services.dart';
import 'package:bookstoreapplication/data/datasource/remote/items_data.dart';


import '../core/shared/searchmixController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/bookModel.dart';
import '../data/model/categoriersModel.dart';

abstract class ItemsController extends SearchMixController {
  intialData();
  changeCat(int val, String catval);
  getBooks(String categoryid);
  goToPageProductDetails(BookModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List<CategoriersModel> categories = [];
  String? catid;
  int? selectedCat;
 
  ItemsData testData = ItemsData(Get.find());

  List data = [];
  List<BookModel> itemsData = [];
  List<BookModel> items = [];
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  String? userid;
  @override
  intialData() {

    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    userid = myServices.sharedPreferences.getString("userid");
   //getItems(catid!);
   getBooks(catid!);

  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    //getItems(catid!);
      getBooks(catid!);
    update();
  }

  @override
  getBooks(String categoryid) async {
    data.clear();
    items.clear();
    itemsData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await testData.getData(userid!,categoryid);
    //var response = await testData.getData3(categoryid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        for (Map servpro in response['books']) {
          items.add(BookModel.fromJson(servpro));
        }
          items.forEach((element) {
          if (element.bookCat == categoryid) {
            itemsData.add(element);
          }
        });
      
        update();
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    // End
    //}
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
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
