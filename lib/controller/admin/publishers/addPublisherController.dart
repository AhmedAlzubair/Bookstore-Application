import 'dart:io';


import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:bookstoreapplication/core/functions/handingdatacontroller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/functions/chooseImage.dart';
import '../../../data/admin/datasource/remote/publishers/homeAdminPublisherData.dart';
import '../../../view/admin/publisher/view.dart';

class AddPublisherControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  HomeAdminPublisherData homedata = HomeAdminPublisherData(Get.find());

 

  late TextEditingController name;
File? myfile;
  StatusRequest statusRequest = StatusRequest.none;
   chooseImage() async {
    myfile = await chooseImagePickerGallery();
    update();
  }

  chooseImageCamera() async {
    myfile = await chooseImagePickerCamera();
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    name = TextEditingController();
 
    super.onInit();
  }

  addServ() async {
      if (formstate.currentState!.validate()) {
      if (myfile == null) {
        Get.snackbar("warnning", "Choose Image");
      } else {
 

          statusRequest = StatusRequest.loading;
      update();
      Map data = {"name": name.text};
      var response = await homedata.addDataPub(data,myfile);
      print("====================$response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.homePublisherAdminView);
          // HomeServiceAdminControllerImp serv = Get.find();
          // serv.getdataserves();
        
      } else {}
      update();
    }
      }
    
  }
      }
}
