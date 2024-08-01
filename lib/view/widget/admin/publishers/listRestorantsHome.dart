import 'package:bookstoreapplication/controller/admin/homeadminController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookstoreapplication/controller/home_controller.dart';

import '../../../../controller/admin/publishers/homeAdminPublisher_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/translatefatabase.dart';
import '../../../../data/model/categoriersModel.dart';
import '../../../../data/model/publisherModel.dart';
import '../../../../data/model/servesModel.dart';
import '../../../../linkapi.dart';

class RestorantsAdmin extends GetView<HomePublisherAdminControllerImp> {
  const RestorantsAdmin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Get.put(HomeControllerImp());
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.serves.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
      ),
      itemBuilder: (context, index) => ListRestorantsServiceAdminHome(
        i: index,
        categoriesModel: controller.serves[index],
      ),
    );
  }
}

class ListRestorantsServiceAdminHome
    extends GetView<HomePublisherAdminControllerImp> {
  final PublisherModel categoriesModel;
  final int i;
  const ListRestorantsServiceAdminHome(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      // controller.goTocat(controller.serves, i, categoriesModel.servesId!);
      },
      child: Card(
       // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Image.network(
                "${AppLink.imagestPublisher}/${categoriesModel.publisherImage}",
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              //const SizedBox(height: 20,),
              // Text(categoriesModel.servesName!),
              Text(
               categoriesModel.publisherName!,
                style: const TextStyle(fontSize: 20, color: AppColor.primaryColor),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          controller.goToEdit(categoriesModel);
                        }),
                    IconButton(
                        icon: const Icon(Icons.delete_outline_outlined),
                        onPressed: () {
                          controller.deleteServ(categoriesModel.publisherId!,categoriesModel.publisherImage!);
                             
                        }),
                  ],
                ),
              )
             
            ]),
      ),
    );
  }
}
