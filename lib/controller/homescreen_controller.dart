import 'package:bookstoreapplication/view/screen/home.dart';
import 'package:bookstoreapplication/view/screen/notification.dart';
import 'package:bookstoreapplication/view/screen/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/Services/services.dart';
import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handingdatacontroller.dart';
import '../data/Model/servesModel.dart';
import '../data/datasource/remote/serves_data.dart';

import '../view/screen/officer/officer.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    const HomePage(),
     const Officer(),
   const NotificationView() ,
   const Settings()
  ];

  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "Officer", "icon": Icons.category_outlined},
    {"title": "Nptification", "icon": Icons.notifications_active_outlined},
    {"title": "profile", "icon": Icons.person_pin_sharp},
    {"title": "settings", "icon": Icons.settings}
  ];
  @override
  void onInit() {
    // serve = Get.arguments['serves'];
    // servID = Get.arguments["servid"];
    // selectedCat = Get.arguments['selectedcat'];
    //getdata();
    super.onInit();
  }


  @override
  changePage(int index) {
    currentpage = index;
    update();
  }
}
