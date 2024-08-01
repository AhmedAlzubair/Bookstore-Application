import 'package:bookstoreapplication/core/constant/color.dart';
import 'package:bookstoreapplication/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../controller/admin/orders/orderadmincontroller.dart';
import '../../../../core/class/handlingdataview.dart';


class CardOrderAproveAdmin extends GetView<OrderAdminControllerImp> {

  final OrdersModel ordersModel;
  const CardOrderAproveAdmin({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return  Card(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order ID: ${ordersModel.ordersId}",
                      style:const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor2),
                    ),
                    //Jiffy()
                    Text(Jiffy.parse(ordersModel.ordersDatetime.toString(), pattern:"yyyy-MM-dd")
                        .fromNow()),
                  ],
                ),
                Text("Order Price: ${ordersModel.ordersPrice}\$",
                    style:const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor2)),
                Text(
                    "Order Type: ${controller.printOrderType(ordersModel.ordersType!)}",
                    style:const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor2)),
                Text(
                    "Order Pyment: ${controller.printPaymentMethod(ordersModel.ordersPaymentmethod!)}",
                    style:const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor2)),
                Text("Order Total Price: ${ordersModel.ordersTotalprice}\$",
                    style:const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor2)),
               const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      color: AppColor.thirdColor,
                      onPressed: () {
                        controller.goToDetails(ordersModel);
                      },
                      child:const Text("Details",
                          style: TextStyle(
                              color: AppColor.primaryColor2,
                              fontWeight: FontWeight.bold)),
                    ),
                    MaterialButton(
                      color: AppColor.thirdColor,
                      onPressed: () {
                        controller.aproveData(
                            ordersModel.ordersUsersid.toString(),
                            ordersModel.ordersId.toString());
                      },
                      child:const Text(
                        "Aprove",
                        style: TextStyle(
                            color: AppColor.primaryColor2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ]),
        
    ));
  }
}
