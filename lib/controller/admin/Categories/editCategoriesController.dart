import 'dart:io';

import 'package:bookstoreapplication/controller/admin/publishers/homeAdminPublisher_controller.dart';
import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:bookstoreapplication/core/functions/handingdatacontroller.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/functions/chooseImage.dart';
import '../../../data/admin/datasource/remote/Categories/homeAdminCategoriesData.dart';
import '../../../data/model/categoriersModel.dart';

class EditCategoriesControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  HomeAdminCategoriesData homedata = HomeAdminCategoriesData(Get.find());
  File? myfile;

  chooseImage() async {
    myfile = await chooseImagePickerGallery();
    update();
  }

  chooseImageCamera() async {
    myfile = await chooseImagePickerCamera();
    update();
  }

  TextEditingController name = TextEditingController();

  StatusRequest statusRequest = StatusRequest.none;
  late CategoriersModel servesModel;

  late String imageold;
  late String catid;
  @override
  void onInit() {
    // TODO: implement onInit
    servesModel = Get.arguments["Categories"];

    imageold = servesModel.categoriersImage.toString();
    // name = TextEditingController();
    // nameAr = TextEditingController();
    catid = servesModel.categoriersId.toString();
    name.text = servesModel.categoriersName.toString();

    super.onInit();
  }

  editDataServes() async {
    if (formstate.currentState!.validate()) {
      // if (myfile == null) {
      //   Get.snackbar("warnning", "Choose Image");
      // } else {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": catid.toString(),
        "name": name.text, 
        "imageold": imageold
      };
      var response = await homedata.editData(data, myfile);
      print("====================$response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.homeCategoriesAdminView);
          // HomeServiceAdminControllerImp serv = Get.find();
          // serv.getdataserves();
        }
      } else {}
      update();
      // }
    }
  }
}
