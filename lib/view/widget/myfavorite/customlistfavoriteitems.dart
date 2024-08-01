import 'package:cached_network_image/cached_network_image.dart';
import 'package:bookstoreapplication/controller/favorite_controller.dart';
import 'package:bookstoreapplication/controller/items_controller.dart';
import 'package:bookstoreapplication/controller/myfavoritecontroller.dart';
import 'package:bookstoreapplication/core/constant/color.dart';

import 'package:bookstoreapplication/data/model/myfavorite.dart';
import 'package:bookstoreapplication/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/imgaeasset.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsModel;
  // final bool active;
  const CustomListFavoriteItems({Key? key, required this.itemsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
           //controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
                children: [
                  Hero(
                    tag: "${itemsModel.bookId}",
                    child:
                    FadeInImage(placeholder:const AssetImage(AppImageAsset.logo) ,
                      image:NetworkImage("${AppLink.imagestProduct}/${itemsModel.bookImage}",),
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
              
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Text(
                       itemsModel.bookName!,
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Rating 3.5 ", textAlign: TextAlign.center),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: 22,
                          child: Row(
                            children: [
                              ...List.generate(
                                  5,
                                  (index) => const Icon(
                                        Icons.star,
                                        size: 10,
                                      ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${itemsModel.bookPrice} \$",
                            style: const TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "sans")),
                        IconButton(
                            onPressed: () {
                                controller.deleteFromFavorite(itemsModel.favoriteId!) ;
                            },
                            icon: Icon(
                              Icons.delete_outline_outlined,
                              color: AppColor.primaryColor,
                            ))
                      ],
                    ),
                  )
                ]),
          ),
        ));
  }
}






























// logical thinking

  // GetBuilder<FavoriteController>(
  //                         builder: (controller) => IconButton(
  //                             onPressed: () {
  //                                 if (controller.isFavorite[itemsModel.itemsId] == "1" ) {
  //                                   controller.setFavorite(
  //                                       itemsModel.itemsId, "0");
  //                                 } else {
  //                                   controller.setFavorite(
  //                                       itemsModel.itemsId, "1");
  //                                 }
  //                             },
  //                             icon: Icon(
  //                               controller.isFavorite[itemsModel.itemsId] == "1"
  //                                   ? Icons.favorite
  //                                   : Icons.favorite_border_outlined,
  //                               color: AppColor.primaryColor,
  //                             )))