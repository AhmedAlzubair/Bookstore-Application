import 'dart:io';
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

class EditBooksControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  HomeAdminProductsData homedata = HomeAdminProductsData(Get.find());
  File? myfile;
  String? catid;
  String? sertname;
  String? pubName;
  String? pubId;
  //List<CategoriersModel> proData = [];
  List<PublisherModel> pubData = [];
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

  chooseImage() async {
    myfile = await chooseImagePickerGallery();
    update();
  }

  chooseImageCamera() async {
    myfile = await chooseImagePickerCamera();
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
  // chooseType(int ty) {
  //   catid = ty;
  //   //sertype = serves[ty].servesName;
  //   print("====================================$catid");
  //   update();
  // }

  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController count = TextEditingController();
  TextEditingController active = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController discount = TextEditingController();
  //TextEditingController catid = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  late BookModel productModel;
  late String proid;
  //late List<ItemsModel2> serves;
  List<CategoriersModel> catData = [];
  late String imageold;
  @override
  void onInit() {
    // getdatacat();
    // TODO: implement onInit
    productModel = Get.arguments["book"];
    //serves = Get.arguments["products"];
    pubData = Get.arguments["Publishers"];
    catData = Get.arguments["Catgories"];
    proid = productModel.bookId.toString();
    catid = productModel.bookCat.toString();
    imageold = productModel.bookImage.toString();
    // name = TextEditingController();
    // nameAr = TextEditingController();
    name.text = productModel.bookName.toString();
    desc.text = productModel.bookDesc.toString();
    count.text = productModel.bookCount.toString();
    price.text = productModel.bookPrice.toString();
    discount.text = productModel.bookDiscount.toString();
    active.text = productModel.bookActive.toString();
    // sertname = productModel.categoriersName.toString();
    pubId = productModel.bookPublisherid.toString();
    // pubName = pubData.map((e) {
    //   if (e.publisherId == pubId) return e.publisherName;
    // }).toString();
    // getdatacat();
    // getdataPub();
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
        "id": proid,
        "name": name.text,
        "desc": desc.text,
        "count": count.text,
        "active": active.text,
        "price": price.text,
        "discount": discount.text,
        "catid": catid,
        "publisherid": pubId.toString(),
        "imageold": imageold
      };
      var response = await homedata.editData(data, myfile);
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
      // }
    }
  }

}
