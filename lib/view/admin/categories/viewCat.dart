import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/admin/Categories/HomeCategoriesAdminView_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/admin/Categories/listCategoriesHome.dart';


class HomeCategoriesAdminView extends StatelessWidget {
  const HomeCategoriesAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeCategoriesControllerImp());
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "48".tr,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.primaryColor),
        )),
        body:GetBuilder<HomeCategoriesControllerImp>(
      builder: (controller) =>HandlingDataView(
                statusRequest: controller.statusRequest,
                widget:
        
         SingleChildScrollView(
          child: Column(
            children: [
          
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: 
               
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.catData.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) => ListCategoriesAdminHome(
                      i: index,
                      categoriesModel: controller.catData[index],
                    ),
                  ))
                
            
            
            ]),
        ),
      )),
       
        floatingActionButton: FloatingActionButton(
           backgroundColor: AppColor.primaryColor,
          onPressed: () {
          Get.offNamed(AppRoute.homeCategoriesAdminAdd);
        },
        child: const Icon(Icons.add),
        
       // child: ,
        
        ),
         floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
    
    );
  }
}
