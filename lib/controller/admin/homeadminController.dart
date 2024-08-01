import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../view/admin/homeadminScreen.dart';
import '../../view/admin/orders/adminOrderpending.dart';
import '../../view/admin/orders/adminViewOrdersScreen.dart';

class HomeAdminControllerImp extends GetxController {
  int currentindex = 0;
  List<Widget> listpage = [
 const AdminViewOrdersScreen(),
   const AdminOrderPandingScreen(),
  ];
  changIndex(int val) {
    currentindex = val;
    update();
  }
  List bottomappbar = [
    {"title": "Panding", "icon": Icons.home},
    {"title": "Proved", "icon": Icons.notifications_active_outlined},
    {"title": "profile", "icon": Icons.person_pin_sharp},
    {"title": "settings", "icon": Icons.settings}
  ];
}
