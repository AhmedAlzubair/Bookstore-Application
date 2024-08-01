import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/user/signUpController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUpUser extends StatelessWidget {
  const SignUpUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpAdminControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('17'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpAdminControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "10".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: "24".tr),
                      const SizedBox(height: 15),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 20, "username");
                        },
                        mycontroller: controller.username,
                        hinttext: "23".tr,
                        iconData: Icons.person_outline,
                        labeltext: "20".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,

                        valid: (val) {
                          return validInput(val!, 3, 40, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "12".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "18".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: true,
                        valid: (val) {
                          return validInput(val!, 7, 11, "phone");
                        },
                        mycontroller: controller.phone,
                        hinttext: "22".tr,
                        iconData: Icons.phone_android_outlined,
                        labeltext: "21".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                          obscureText: controller.isshowpassword,
                           onTapIcon: () {
                            controller.showPassword();
                          },
                        isNumber: false,

                        valid: (val) {
                          return validInput(val!, 3, 30, "password");
                        },
                        mycontroller: controller.password,
                        hinttext: "13".tr,
                        iconData: Icons.lock_outline,
                        labeltext: "19".tr,
                        // mycontroller: ,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Type",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: AppColor.primaryColor2,
                                    fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Admin"),
                                    onTap: () {},
                                    value: "admin",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Delivery"),
                                    onTap: () {},
                                    value: "delivery",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("User"),
                                    onTap: () {},
                                    value: "user",
                                  ),
                                ],
                                onChanged: (val) {
                                  controller.chooseType(val!);
                                },
                                value: controller.type,),
                          )
                        ],
                      ),
                       const SizedBox(height: 20),
                      CustomButtomAuth(
                          text: "17".tr,
                          onPressed: () {
                            controller.signUp();
                          }),
                      const SizedBox(height: 40),
                      // CustomTextSignUpOrSignIn(
                      //   textone: "25".tr,
                      //   texttwo: "26".tr,
                      //   onTap: () {
                      //     controller.goToSignIn();
                      //   },
                      // ),
                    ]),
                  ),
                )),
          )),
    );
  }
}
