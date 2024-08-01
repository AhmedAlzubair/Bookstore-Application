
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/admin/Books/HomeBooksAdminView_controller.dart';
import '../../../controller/admin/user/adminViewUser_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../widget/admin/products/listProductsHome.dart';
import '../../widget/admin/users/listUsersAdminHome.dart';

class HomeUsersAdminView extends StatelessWidget {
  const HomeUsersAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminViewUsercontrollerImp());
    return GetBuilder<AdminViewUsercontrollerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
            title: Text(
          "Users",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.primaryColor),
        )),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GridView.builder(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.userData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) => ListUsersAdminHome(
                i: index,
                cusersModel: controller.userData[index],
              ),
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            Get.offNamed(AppRoute.homeUsersAdminAdd);
         // controller.goToAdd();
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
