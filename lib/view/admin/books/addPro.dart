
import 'package:bookstoreapplication/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/admin/Books/addBooksController.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatefatabase.dart';
import '../../../core/functions/validinput.dart';
import '../../delivery/widget/auth/customTextFormAuth.dart';
import '../../widget/admin/publishers/customButtomService.dart';
import '../../widget/admin/publishers/customTextFormService.dart';

class HomeProductsAdminAdd extends StatelessWidget {
  const HomeProductsAdminAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddBooksControllerImp());
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "54".tr,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.primaryColor),
        )),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GetBuilder<AddBooksControllerImp>(
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
                        hinttext: "Enter Book Name",
                        // iconData: Icons.email_outlined,
                        labeltext: " Name ",
                        // mycontroller: ,
                      ),
                    
                  
                        CustomTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 3, 30, "");
                              },
                              mycontroller: controller.desc,
                              hinttext: "Enter Book Desc",
                              iconData: Icons.phone_android_outlined,
                              labeltext: "Desc",
                              // mycontroller: ,
                            ),
                       
                        CustomTextFormAuth(
                              isNumber: true,
                              valid: (val) {
                                return validInput(val!, 1, 11, "");
                              },
                              mycontroller: controller.count,
                              hinttext: "Enter Book Count ",
                              iconData: Icons.countertops_outlined,
                              labeltext: "Count",
                              // mycontroller: ,
                            ),
                        CustomTextFormAuth(
                              isNumber: true,
                              valid: (val) {
                                return validInput(val!, 1, 11, "");
                              },
                              mycontroller: controller.price,
                              hinttext: "Enter Book Price",
                              iconData: Icons.price_check_outlined,
                              labeltext: "Price",
                              // mycontroller: ,
                            ),
                        CustomTextFormAuth(
                              isNumber: true,
                              valid: (val) {
                                return validInput(val!, 1, 11, "");
                              },
                              mycontroller: controller.discount,
                              hinttext: "Enter Book DisCount",
                              iconData: Icons.discount_outlined,
                              labeltext: "DisCount",
                              // mycontroller: ,
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Categorie Name",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: AppColor.primaryColor,
                                    fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                                items: [
                                  ...List.generate(
                                      controller.proData.length,
                                      (index) => DropdownMenuItem(
                                            child: Text(
                                           controller.proData[index].categoriersName!,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: AppColor.primaryColor),
                                            ),
                                            
                                            onTap: () {
                                              controller.chooseType2(controller.proData[index].categoriersId!,controller.proData[index].categoriersName!);
                                            },
                                            value:controller.proData[index].categoriersName,
                                          ))
                                ],
                                value:controller.sertname ,
                                onChanged: (val) {
                                  // controller.chooseType(val!);
                                }
                                ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Publisher Name",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: AppColor.primaryColor,
                                    fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                                items: [
                                  ...List.generate(
                                      controller.pubData.length,
                                      (index) => DropdownMenuItem(
                                            child: Text(
                                           controller.pubData[index].publisherName!,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: AppColor.primaryColor),
                                            ),
                                            
                                            onTap: () {
                                              controller.chooseTypePub(controller.pubData[index].publisherId!,controller.pubData[index].publisherName!);
                                            },
                                            value:controller.pubData[index].publisherName,
                                          ))
                                ],
                                value:controller.pubName ,
                                onChanged: (val) {
                                  // controller.chooseType(val!);
                                }
                                ),
                          )
                        ],
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
