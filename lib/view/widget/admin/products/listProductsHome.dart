
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/admin/Books/HomeBooksAdminView_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/translatefatabase.dart';

import '../../../../data/model/bookModel.dart';
import '../../../../linkapi.dart';


class ListProductsAdminHome
    extends GetView<HomeBooksControllerImp> {
  final BookModel categoriesModel;
  final int i;
  const ListProductsAdminHome(
      {super.key, required this.categoriesModel, required this.i});

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
              Image.network(
                "${AppLink.imagestProduct}/${categoriesModel.bookImage}",
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              //const SizedBox(height: 20,),
              // Text(categoriesModel.servesName!),
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5),
                child: Text(
               categoriesModel.bookName!,
                  style: const TextStyle(fontSize: 20, color: AppColor.primaryColor),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   
                    IconButton(
                        icon: const Icon(Icons.delete_outline_outlined),
                        onPressed: () {
                          controller.deletepro(categoriesModel.bookId.toString(),
                              categoriesModel.bookImage.toString());
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
