import 'package:bookstoreapplication/controller/admin/publishers/addPublisherController.dart';
import 'package:bookstoreapplication/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/Categories/addCategoriesController.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatefatabase.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/admin/publishers/customButtomService.dart';
import '../../widget/admin/publishers/customTextFormService.dart';

class HomeCategoriesAdminAdd extends StatelessWidget {
  const HomeCategoriesAdminAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddCategoriesControllerImp());
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "53".tr,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.primaryColor),
        )),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GetBuilder<AddCategoriesControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                     const SizedBox(height: 10,),
                      CustomTextFormService(
                        valid: (val) {
                          return validInput(val!, 3, 100, "");
                        },
                        mycontroller: controller.name,
                        hinttext: "Enter Categorie Name",
                        // iconData: Icons.email_outlined,
                        labeltext: " Name ",
                        // mycontroller: ,
                      ),
                      CustomButtomService(
                        text: "Choose Image",
                        onPressed: () {
                          Get.defaultDialog(title: "Choose Image", actions: [
                            CustomButtomService(
                              text: "Camera",
                              onPressed: () {
                                controller.chooseImageCamera();
                                Get.back();
                              },
                            ),
                            CustomButtomService(
                              text: " Gallery",
                              onPressed: () {
                                controller.chooseImage();
                                Get.back();
                              },
                            ),
                          ]);
                        },
                        myfile: controller.myfile == null ? false : true,
                      ),
                      CustomButtomService(
                        text: "Add",
                        onPressed: () {
                          controller.addServ();
                        },
                      ),
                    ])),
              ),
            )));
  }
}
