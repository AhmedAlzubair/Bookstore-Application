
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/orders/orderadmincontroller.dart';
import '../../../core/class/handlingdataview.dart';
import '../widget/order/cardOrderAproveAdmin.dart';

class AdminViewOrdersScreen extends StatelessWidget {
  const AdminViewOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderAdminControllerImp());
   
    return GetBuilder<OrderAdminControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
             widget:Container(
      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: 
       ListView.builder(
        itemCount: controller.order.length,
        itemBuilder: (context,index)=>CardOrderAproveAdmin(ordersModel:controller.order[index] ,)),
      )));
  }
}