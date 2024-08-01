import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/delivery/orderdelivery/aproveorder.dart';
import '../../view/delivery/orderdelivery/pending.dart';

class HomeScreenDeliveryController extends GetxController {
  int currentindex = 0;
  List<Widget> pagelist = [
  const PandingScreen(),
  const  AproveScreen()
  ];
   List bottomappbar = [
    {"title": "Panding", "icon": Icons.home},
    {"title": "Accept", "icon": Icons.access_alarm_outlined},
    {"title": "profile", "icon": Icons.person_pin_sharp},
    {"title": "settings", "icon": Icons.settings}
  ];

  change(int val) {
    currentindex = val;
    update();
  }
}
