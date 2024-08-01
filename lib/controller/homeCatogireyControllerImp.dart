
import 'package:bookstoreapplication/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/constant/routes.dart';
import '../core/functions/handingdatacontroller.dart';
import 'package:bookstoreapplication/core/services/services.dart';
import '../data/Model/servesModel.dart';
import '../data/model/CategoriesModel2.dart';



class HomeCategoriesControllerImpelment extends GetxController {
  MyServices myServices = Get.find();
 HomeData homedata = HomeData(Get.find());
  List<ServesModel> serves = [];

  String? lang;
  bool IsLang = false;
  List<CategoriersModel> cat = [];
  List<CategoriersModel> catData = [];

  int? selectedCat;
  int? servID;
  StatusRequest statusRequest = StatusRequest.none;


  @override
  void onInit() {
    serves = Get.arguments['serves'];
    servID = Get.arguments["serid"];
    selectedCat = Get.arguments['selectedcat'];
    getcat2(servID!);

    super.onInit();
  }

  changeCat(val, catval) {
    selectedCat = val;
    servID = catval;
    getcat2(servID!);
    update();
  }


  getcat(int servId) async {
    cat.clear();
    catData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['categories']) {
        cat.add(CategoriersModel.fromJson(servpro));
      }
      cat.forEach((element) {
        if (element.categoriersServes == servId) {
          catData.add(element);
        }
      });
    } else {
      statusRequest = StatusRequest.failure;
    }
    // }
    update();
  }

  getcat2(int servId) async {
    cat.clear();
    catData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getDataCat(servId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['categories']) {
        catData.add(CategoriersModel.fromJson(servpro));
      }
     
    } else {
      statusRequest = StatusRequest.failure;
    }
    // }
    update();
  }

  goToItems(
      List<CategoriersModel> categories, int selectedCat, int categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid,
      "serves":serves
    });
  }

  isLang() {
    if (lang == "Ar") {
      IsLang = true;
    } else {
      IsLang = false;
    }
    update();
  }

}

// class SearchMixController extends GetxController {
//   searchData() async {}
//   StatusRequest statusRequest = StatusRequest.none;
//   bool isSearch = false;
//   late TextEditingController search;
//   checkSearch(val) {
//     if (val == "") {
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
