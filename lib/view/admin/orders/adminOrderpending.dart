import 'package:bookstoreapplication/controller/delivery/order/pandingController.dart';
import 'package:bookstoreapplication/controller/orders/pending_controller.dart';
import 'package:bookstoreapplication/core/class/handlingdataview.dart';
import 'package:bookstoreapplication/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/admin/orders/orderAdminpandingController.dart';
import '../widget/order/cardorderpandingadmin.dart';



class AdminOrderPandingScreen extends GetView<OrderAdminPandingControllerImp> {
  const AdminOrderPandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderAdminPandingControllerImp());
    return  GetBuilder<OrderAdminPandingControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
             widget: Container(
        padding: const EdgeInsets.all(10),
        margin:const EdgeInsets.only(top: 15),
        child: 
          
              ListView.builder(
                // shrinkWrap: true,
                // physics:const NeverScrollableScrollPhysics(),
                itemCount: controller.order.length,
                itemBuilder: (context, index) =>CardOrderPandingAdmin(ordersModel: controller.order[index]) ,
                
              ),
            
          ),
        ),
       
      
    );
  }
}
