import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../data/admin/datasource/remote/auth/signupAdminData.dart';
import '../../../data/model/userModel.dart';

abstract class EditAdminController extends GetxController {
  signUp();
  goToSignIn();
}

class EditAdminControllerImp extends EditAdminController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  String? type;
  late Users user;
  bool isshowpassword = true;
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  chooseType(String ty) {
    type = ty;
    print("==================$type");
    update();
  }

  StatusRequest statusRequest = StatusRequest.none;

  SignupAdminData signupData = SignupAdminData(Get.find());

  List data = [];

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.editdata(
          username.text, password.text, email.text, phone.text, type!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          // Get.offNamed(AppRoute.verfiyCodeSignUp,
          //     arguments: {"email": email.text});
          Get.offNamed(AppRoute.homeUsersAdminView);
        } else {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: "Phone Number Or Email Already Exists");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    user = Get.arguments['user'];
    username.text = user.userName.toString();
    phone.text = user.userPhone.toString();
    email.text = user.userEmail.toString();
    password.text = user.userPassword.toString();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
