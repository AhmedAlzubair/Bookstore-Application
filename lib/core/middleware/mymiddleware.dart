import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:bookstoreapplication/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      if(   myServices.sharedPreferences.getString("userType")=="admin"){
       return const RouteSettings(name: AppRoute.homeAdminScreen);
      }
      if(   myServices.sharedPreferences.getString("userType")=="delivery"){
       return const RouteSettings(name: AppRoute.homeScreenDelivery);
      }
      if(   myServices.sharedPreferences.getString("userType")=="user"){
       return const RouteSettings(name: AppRoute.homescreen);
      }
    
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }

    return null;
  }
}
