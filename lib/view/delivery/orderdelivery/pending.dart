import 'package:bookstoreapplication/controller/delivery/order/pandingController.dart';
import 'package:bookstoreapplication/core/class/handlingdataview.dart';
import 'package:bookstoreapplication/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../widget/order/cardorderpandingdelivery.dart';

class PandingScreen extends StatelessWidget {
  const PandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PandingControllerImp());
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin:const EdgeInsets.only(top: 15),
        child: GetBuilder<PandingControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
             widget: 
          Column(
            
            children: [
                 Text(
                    "Order",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: AppColor.primaryColor2,
                        ),
                    textAlign: TextAlign.center,
                  ),
              ListView.builder(
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                itemCount: controller.order.length,
                itemBuilder: (context, index) =>CardOrderPandingDelivery(ordersModel: controller.order[index]) ,
                
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
