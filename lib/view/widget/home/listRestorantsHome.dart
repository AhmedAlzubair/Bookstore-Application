import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookstoreapplication/controller/home_controller.dart';
import '../../../core/constant/color.dart';

import '../../../data/model/categoriersModel.dart';
import '../../../linkapi.dart';

class Restorants extends GetView<HomeControllerImp> {
  const Restorants({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Get.put(HomeControllerImp());
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.catData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) => ListRestorantsHome(
        i: index,
        categoriesModel: controller.catData[index],
      ),
    );
  }
}

class ListRestorantsHome extends GetView<HomeControllerImp> {
  final CategoriersModel categoriesModel;
  final int i;
  const ListRestorantsHome(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goTocat(controller.catData, i, categoriesModel.categoriersId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "${AppLink.imagestcatss}/${categoriesModel.categoriersImage}",
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              // Text(categoriesModel.servesName!),
              Text(
                "${categoriesModel.categoriersName}",
                style: const TextStyle(fontSize: 20, color: AppColor.primaryColor),
              )
            ]),
      ),
    );
  }
}
