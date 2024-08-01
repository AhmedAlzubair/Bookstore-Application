import 'package:bookstoreapplication/controller/homeCatogireyControllerImp.dart';
import 'package:bookstoreapplication/core/constant/color.dart';
import 'package:bookstoreapplication/core/functions/translatefatabase.dart';
import 'package:bookstoreapplication/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/Model/servesModel.dart';


class ListServesHome extends GetView<HomeCategoriesControllerImpelment> {
  const ListServesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.put(HomeServesControllerImp());
    return GetBuilder<HomeCategoriesControllerImpelment>(
      builder: (controller) => SizedBox(
        height: 140,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: controller.serves.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoriesServes(
              i: index,
              categoriesModel: controller.serves[index],
            );
          },
        ),
      ),
    );
  }
}

class CategoriesServes extends GetView<HomeCategoriesControllerImpelment> {
  final ServesModel categoriesModel;
  final int? i;
  const CategoriesServes(
      {Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!, categoriesModel.servesId!);
    
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 100,
            width: 100,
            child: Image.network(
              "${AppLink.imagestcatss}/${categoriesModel.servesImage}",
              width: 80, height: 80,
              //color: AppColor.secondColor
            ),
          ),
          Text(
            "${translateDatabase(categoriesModel.servesNameAr, categoriesModel.servesName)}",
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }
}
