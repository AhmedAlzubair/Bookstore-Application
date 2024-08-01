import 'package:bookstoreapplication/controller/admin/publishers/addPublisherController.dart';
import 'package:bookstoreapplication/core/class/handlingdataview.dart';
import 'package:bookstoreapplication/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/admin/publishers/editPublisherController.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/admin/publishers/customButtomService.dart';
import '../../widget/admin/publishers/customTextFormService.dart';


class HomePublisherAdminEdit extends StatelessWidget {
  const HomePublisherAdminEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditPublisherControllerImp());
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "50".tr,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.primaryColor),
        )),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GetBuilder<EditPublisherControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      CustomTextFormService(
                        valid: (val) {
                          return validInput(val!, 3, 100, "");
                        },
                        mycontroller: controller.name,
                        hinttext: "Enter Publisher Name",
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
                        text: "Edit",
                        onPressed: () {
                          controller.editDataServes();
                        },
                      ),
                    ])),
              ),
            )));
  }
}
