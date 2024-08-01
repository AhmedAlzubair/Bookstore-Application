
import 'package:bookstoreapplication/core/class/handlingdataview.dart';
import 'package:bookstoreapplication/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/delivery/order/aproveCotroller.dart';
import '../widget/order/cardOrderAproveDelivery.dart';


class AproveScreen extends StatelessWidget {
  const AproveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AproveControllerImp());
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin:const EdgeInsets.only(top: 15),
        child: GetBuilder<AproveControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
             widget: 
          Column(
            
            children: [
                 Text(
                    "Order Aprove",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: AppColor.primaryColor2,
                        ),
                    textAlign: TextAlign.center,
                  ),
              ListView.builder(
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                itemCount: controller.order.length,
                itemBuilder: (context, index) =>CardOrderAproveDelivery(ordersModel: controller.order[index]) ,
                
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
