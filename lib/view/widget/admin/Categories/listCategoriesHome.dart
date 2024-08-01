
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/admin/Categories/HomeCategoriesAdminView_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/translatefatabase.dart';
import '../../../../data/model/categoriersModel.dart';
import '../../../../linkapi.dart';

class RestorantsAdmin extends GetView<HomeCategoriesControllerImp> {
  //final List<CategoriersModel> cat;
  final CategoriersModel cat;
  final int indexserv;

  const RestorantsAdmin(this.cat, this.indexserv, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Get.put(HomeControllerImp());
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.catData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) => ListCategoriesAdminHome(
            i: index,
            categoriesModel: controller.catData[index],
          ),
        ));

    // GridView.builder(
    //   shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemCount: cat.length,
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     childAspectRatio: 3 / 2,
    //   ),
    //   itemBuilder: (context, index) => ListCategoriesAdminHome(
    //     i: index,
    //     categoriesModel: cat[index],
    //   ),
    // );
  }
}

class ListCategoriesAdminHome extends GetView<HomeCategoriesControllerImp> {
  final CategoriersModel categoriesModel;
  final int i;
  const ListCategoriesAdminHome(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.goTocat( categoriesModel.categoriersId!);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               CachedNetworkImage(
                          imageUrl:
                "${AppLink.imagestcatss}/${categoriesModel.categoriersImage}",
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              
                     
              //const SizedBox(height: 20,),
              // Text(categoriesModel.servesName!),
              Text(
           categoriesModel.categoriersName!,
                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold ,color: AppColor.primaryColor),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.delete_outline_outlined),
                        onPressed: () {
                          controller.deletecat(
                              categoriesModel.categoriersId.toString(),
                              categoriesModel.categoriersImage.toString());
                        }),
                    IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          controller.goToEdit(categoriesModel);
                        }),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
