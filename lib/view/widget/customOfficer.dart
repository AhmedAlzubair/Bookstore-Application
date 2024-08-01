import 'package:cached_network_image/cached_network_image.dart';
import 'package:bookstoreapplication/controller/favorite_controller.dart';
import 'package:bookstoreapplication/core/constant/color.dart';
import 'package:bookstoreapplication/core/constant/imgaeasset.dart';
import 'package:bookstoreapplication/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/officer_Contoroller.dart';
import '../../data/model/bookModel.dart';

class CustomListOfficer extends GetView<OfficerControllerImp> {
  final BookModel itemsModel;
  // final bool active;
  const CustomListOfficer({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.bookId}",
                        child: 
                          Image.network(
                         
                             "${AppLink.imagestProduct}/${itemsModel.bookImage!}",
                         // height: 100,
                          //fit: BoxFit.fill,
                        ),
                        
                        // CachedNetworkImage(
                        //   imageUrl:
                        //      "${ AppLink.imagestItems}/${itemsModel.productImage!}",
                        //   height: 100,
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                      //const SizedBox(height: 10),
                      Text(
                         itemsModel.bookName!,
                          style: const TextStyle(
                              color: AppColor.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      Row(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${itemsModel.bookPrice} \$",
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sans")),
                          GetBuilder<FavoriteController>(
                              builder: (controller) => IconButton(
                                  onPressed: () {
                                    if (controller.isFavorite[itemsModel.bookId] ==
                                        "1") {
                                      controller.setFavorite(
                                          itemsModel.bookId, "0");
                                      // controller
                                      //     .removeFavorite(itemsModel.productId!);
                                   
                                    } else {
                                      controller.setFavorite(
                                          itemsModel.bookId, "1");
                                      // controller.addFavorite(itemsModel.productId!);
                                    
                                    }
                                  },
                                  icon: Icon(
                                    controller.isFavorite[itemsModel.bookId] == "1"
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: AppColor.primaryColor,
                                  )))
                        ],
                      )
                    ]),
              ),
           if (itemsModel.bookDiscount!= "0")   Positioned(
                top: 4,
                left: 4,
                child: Image.asset(AppImageAsset.saleOne , width: 40,))
            ],
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