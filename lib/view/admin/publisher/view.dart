import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/publishers/homeAdminPublisher_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/admin/publishers/listRestorantsHome.dart';

class HomePublisherAdminView extends StatelessWidget {
  const HomePublisherAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePublisherAdminControllerImp());
    return GetBuilder<HomePublisherAdminControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
            title: Text(
          "49".tr,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.primaryColor),
        )),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: GridView.builder(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.serves.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) => ListRestorantsServiceAdminHome(
                i: index,
                categoriesModel: controller.serves[index],
              ),
            )),
        floatingActionButton: FloatingActionButton(
           backgroundColor: AppColor.primaryColor,
          onPressed: () {
          Get.offNamed(AppRoute.homePublisherAdminAdd);
        },
        child: const Icon(Icons.add),
        
       // child: ,
        
        ),
         floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
