import 'dart:io';

import 'package:bookstoreapplication/controller/admin/publishers/homeAdminPublisher_controller.dart';
import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:bookstoreapplication/core/functions/handingdatacontroller.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/functions/chooseImage.dart';
import '../../../data/admin/datasource/remote/Products/homeAdminProductsData.dart';

import '../../../data/model/bookModel.dart';
import '../../../data/model/categoriersModel.dart';
import '../../../data/model/publisherModel.dart';

class AddBooksControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  HomeAdminProductsData homedata = HomeAdminProductsData(Get.find());
  File? myfile;
  List<BookModel> serves = [];
  List<CategoriersModel> proData = [];
 
   List<PublisherModel> pubData = [];
  chooseImage() async {
    myfile = await chooseImagePickerGallery();
    update();
  }

  chooseImageCamera() async {
    myfile = await chooseImagePickerCamera();
    update();
  }

  String? serty;
  String? pubName;
  String? pubId;
  changeType(String type) {
    serty = type;
    update();
  }

  late TextEditingController name;
  late TextEditingController book_author;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController active;
  late TextEditingController price;
  late TextEditingController discount;
  //TextEditingController catid = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  String? catid;
  String? sertname;
  

  chooseType2(String ty, String name) {
    catid = ty;
    sertname = name;
    //sertype = serves[ty].servesName;
    print("====================================");
    print("====================================$sertname");
    print("====================================$catid");
    print("====================================");
    update();
  }

  chooseTypePub(String ty, String name) {
    pubId = ty;
    pubName = name;
    //sertype = serves[ty].servesName;
    print("====================================");
    print("====================================$pubName");
    print("====================================$pubId");
    print("====================================");
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    name = TextEditingController();

    desc = TextEditingController();

    count = TextEditingController();
    active = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
   pubData = Get.arguments["Publishers"];
    proData = Get.arguments["Catgories"];
   // getdataserves();
    super.onInit();
  }

  addServ() async {
    if (formstate.currentState!.validate()) {
      if (myfile == null) {
        Get.snackbar("warnning", "Choose Image");
      } else {
        statusRequest = StatusRequest.loading;
        update();
        Map data = {
          "name": name.text,

          "desc": desc.text,

          "count": count.text,
          // "imageold": pr.toString(),
          "price": price.text,
          "discount": discount.text,
          "catid": catid.toString(),
          "publisherid": pubId.toString()
        };
        var response = await homedata.addData(data, myfile);
        print("====================$response");
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            Get.offNamed(AppRoute.homeProductsAdminView);
            // HomeServiceAdminControllerImp serv = Get.find();
            // serv.getdataserves();
          }
        } else {}
        update();
      }
    }
  }

  getdataserves() async {
    proData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.getDataCat();
    print("=============================== Controller $response ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      for (Map servpro in response['categories']) {
        proData.add(CategoriersModel.fromJson(servpro));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    //update();
    //}
    update();
  }
}
