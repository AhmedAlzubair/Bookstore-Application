import 'package:bookstoreapplication/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/admin/homeadminController.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(HomeAdminControllerImp());
    return GetBuilder<HomeAdminControllerImp>(
      builder: (controller) =>  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:Text("Order",style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.primaryColor),) ,),
     
      bottomNavigationBar: BottomNavigationBar(
             selectedItemColor: AppColor.primaryColor,
            unselectedItemColor: AppColor.grey2,
            selectedLabelStyle:const TextStyle(color: AppColor.primaryColor),
            unselectedLabelStyle:const TextStyle(color: AppColor.grey2),
        currentIndex: controller.currentindex,
        onTap: (value) => controller.changIndex(value),
         items: [
              ...List.generate(
                  controller.listpage.length,
                  (index) => BottomNavigationBarItem(
                      label: controller.bottomappbar[index]['title'],
                      icon: Icon(controller.bottomappbar[index]['icon'])))
            ],
        ),
      body:controller.listpage.elementAt(controller.currentindex) ,
      ),
    );
  }
}