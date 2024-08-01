import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/admin/Books/HomeBooksAdminView_controller.dart';
import '../../../../controller/admin/user/adminViewUser_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/translatefatabase.dart';

import '../../../../data/model/bookModel.dart';
import '../../../../data/model/userModel.dart';
import '../../../../linkapi.dart';

class ListUsersAdminHome extends GetView<AdminViewUsercontrollerImp> {
  final Users cusersModel;
  final int i;
  const ListUsersAdminHome(
      {super.key, required this.cusersModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goTocat(controller.serves, i, categoriesModel.servesId!);
      },
      child: Card(
        //margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //const SizedBox(height: 20,),
              // Text(categoriesModel.servesName!),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  cusersModel.userName!,
                  style: const TextStyle(
                      fontSize: 20, color: AppColor.primaryColor),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.delete_outline_outlined),
                        onPressed: () {
                          // controller.deletepro(categoriesModel.bookId.toString(),
                          //     categoriesModel.bookImage.toString());
                          controller.deleteuser(cusersModel.userId!);
                        }),
                    IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          controller.goToEdit(cusersModel);
                        }),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
