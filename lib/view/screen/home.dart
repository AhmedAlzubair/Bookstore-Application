
import 'package:bookstoreapplication/controller/home_controller.dart';
import 'package:bookstoreapplication/core/class/handlingdataview.dart';
import 'package:bookstoreapplication/core/constant/routes.dart';

import 'package:bookstoreapplication/linkapi.dart';
import 'package:bookstoreapplication/view/widget/customappbar.dart';
import 'package:bookstoreapplication/view/widget/home/customcardhome.dart';
import 'package:bookstoreapplication/view/widget/home/customtitlehome.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/functions/translatefatabase.dart';
import '../../data/Model/servesModel.dart';
import '../../data/model/categoriersModel.dart';
import '../widget/home/listRestorantsHome.dart';

class HomePage extends GetView<HomeControllerImp> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  CustomAppBar(
                    mycontroller: controller.search!,
                    titleappbar: "Find Category Book",
                    // onPressedIcon: () {},
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                    onPressedIconFavorite: () {
                      Get.toNamed(AppRoute.myfavroite);
                    },
                  ),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: !controller.isSearch
                          ? SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  CustomCardHome(
                                      title: "A summer surprise",
                                      body: "Cashback 20%"),
                                  CustomTitleHome(title: "48".tr),
                            
                                
                               const Restorants(),
                                ],
                              ),
                          )
                          : ListServerSearch(categoriesModel:controller.listdata)
                          )
                ],
              )),
        );
  }
}

class ListServerSearch extends GetView<HomeControllerImp> {
  final List<CategoriersModel> categoriesModel;
  
  const ListServerSearch( {Key? key, required this.categoriesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categoriesModel.length,
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
      onTap: () {
       // controller.goTocat(controller.catData, i, categoriesModel);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "${AppLink.imagestcatss}/${categoriesModel[index].categoriersImage}",
                width: double.infinity,
                height: 150,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 15,
              ),
              // Text(categoriesModel.servesName!),
              Text(
                "${categoriesModel[index].categoriersName}",
                style: const TextStyle(fontSize: 20, color: AppColor.primaryColor),
              )
            ]),
      ),
    );;
        });
  }
}
