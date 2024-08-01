import 'dart:io';

import 'package:bookstoreapplication/controller/admin/publishers/homeAdminPublisher_controller.dart';
import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:bookstoreapplication/core/functions/handingdatacontroller.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../core/functions/chooseImage.dart';
import '../../../data/admin/datasource/remote/publishers/homeAdminPublisherData.dart';
import '../../../data/model/publisherModel.dart';


class EditPublisherControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  HomeAdminPublisherData homedata = HomeAdminPublisherData(Get.find());

  TextEditingController name = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  late PublisherModel servesModel;
  late String serid;
   File? myfile;
   late String imageold;


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
    servesModel = Get.arguments["publisher"];
    serid = servesModel.publisherId.toString();
    // name = TextEditingController();
    // nameAr = TextEditingController();
    name.text = servesModel.publisherName.toString();
    imageold = servesModel.publisherImage.toString();
    super.onInit();
  }

  editDataServes() async {
    if (formstate.currentState!.validate()) {
      // if (myfile == null) {
      //   Get.snackbar("warnning", "Choose Image");
      // } else {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {"id": serid.toString(), "name": name.text,"imageold":imageold};
      var response = await homedata.editDataPub(data, myfile);
      print("====================$response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.homePublisherAdminView);
          // HomeServiceAdminControllerImp serv = Get.find();
          // serv.getdataserves();
        }
      } else {}
      update();
      // }
    }
  }
}
