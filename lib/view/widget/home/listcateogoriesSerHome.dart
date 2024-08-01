
import 'package:bookstoreapplication/controller/homeCatogireyControllerImp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatefatabase.dart';
import '../../../data/model/CategoriesModel2.dart';
import '../../../linkapi.dart';

class ListcateogoriesSerHome extends GetView<HomeCategoriesControllerImpelment> {
   const ListcateogoriesSerHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Get.put(HomeServesControllerImpelment());
    return GetBuilder<HomeCategoriesControllerImpelment>(
      builder: (controller) =>  GridView.builder(
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
              itemCount: controller.catData.length,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) => ListCatoRestorantsHome(
                    i: index,
                    categoriesModel: controller.catData[index],
                  ),
        
      ),
    );
  }
}

class ListCatoRestorantsHome extends GetView<HomeCategoriesControllerImpelment> {
  final CategoriersModel categoriesModel;
  final int i;
  const ListCatoRestorantsHome(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.catData, i, categoriesModel.categoriersId!);
      },
      child: Card(
        margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "${AppLink.imagestcatss}/${categoriesModel.categoriersImage}",
                width: 200,
                height: 150,
              ),
           const   SizedBox(height: 20,),
             // Text(categoriesModel.servesName!),
              Text(
            "${translateDatabase(categoriesModel.categoriersNameAr, categoriesModel.categoriersName)}",
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          )
            ]),
      ),
    );
  }
}
