import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/delivery/homeScreenDeliveryController.dart';
import '../../../core/constant/color.dart';

class HomeScreenDelivery extends StatelessWidget {
  const HomeScreenDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenDeliveryController());
    return GetBuilder<HomeScreenDeliveryController>(
      builder: (controller) => Scaffold(
        
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: AppColor.grey2,
          selectedLabelStyle: TextStyle(color: AppColor.primaryColor),
          unselectedLabelStyle: TextStyle(color: AppColor.grey2),
          currentIndex: controller.currentindex,
          onTap: (value) {
            controller.change(value);
          },
          items: [
            ...List.generate(
                controller.pagelist.length,
                (index) => BottomNavigationBarItem(
                    label: controller.bottomappbar[index]['title'],
                    icon: Icon(controller.bottomappbar[index]['icon'])))
          ],
        ),
        body: controller.pagelist.elementAt(controller.currentindex),
      ),
    );
  }
}
