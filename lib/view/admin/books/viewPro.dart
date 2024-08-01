
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/admin/Books/HomeBooksAdminView_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/admin/products/listProductsHome.dart';

class HomeProductsAdminView extends StatelessWidget {
  const HomeProductsAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeBooksControllerImp());
    return GetBuilder<HomeBooksControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
            title: Text(
          "56".tr,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.primaryColor),
        )),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GridView.builder(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.proData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) => ListProductsAdminHome(
                i: index,
                categoriesModel: controller.proData[index],
              ),
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
           // Get.offNamed(AppRoute.homeProductsAdminAdd);
            controller.goToAdd();
          },
          child: const Icon(Icons.add),

          // child: ,
        ),
        //  floatingActionButtonLocation:
        //           FloatingActionButtonLocation.,
      ),
    );
  }
}
