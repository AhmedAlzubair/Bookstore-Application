import 'package:cached_network_image/cached_network_image.dart';
import 'package:bookstoreapplication/controller/productdetails_controller.dart';
import 'package:bookstoreapplication/core/constant/color.dart';
import 'package:bookstoreapplication/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(color: AppColor.secondColor),
        ),
        Positioned(
            top: 30.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag: "${controller.itemsModel.bookId}",
              child:
              //  Image.network(
               
              //       "${AppLink.imagestProduct}/${controller.itemsModel.bookImage!}",
              //   height: 250,
              //   fit: BoxFit.fill,
              // ),
              
              
              CachedNetworkImage(
                imageUrl:
                     "${AppLink.imagestProduct}/${controller.itemsModel.bookImage!}",
                width: double.infinity,
                height: 250,
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }
}
