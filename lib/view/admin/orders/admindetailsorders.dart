import 'package:bookstoreapplication/core/constant/color.dart';
import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/admin/orders/admindetailsOrdersController.dart';
import '../../../controller/delivery/order/detailsDeliveryController.dart';

class AdminDetailsOrders extends StatelessWidget {
  const AdminDetailsOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminDetailsOrderControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Details",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: AppColor.primaryColor2),
          ),
        ),
        body: GetBuilder<AdminDetailsOrderControllerImp>(
            builder: (controller) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListView(children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Column(children: [
                          Table(
                            children: [
                              TableRow(children: [
                                Text("Item",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor2,
                                        fontWeight: FontWeight.bold)),
                                Text("QTY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor2,
                                        fontWeight: FontWeight.bold)),
                                Text("Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor2,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              ...List.generate(
                                  controller.card.length,
                                  (index) => TableRow(children: [
                                        Text(
                                            "${controller.card[index].bookName}",
                                            textAlign: TextAlign.center),
                                        Text(
                                            "${controller.card[index].countbook}",
                                            textAlign: TextAlign.center),
                                        Text(
                                            "${controller.card[index].bookPrice}\$",
                                            textAlign: TextAlign.center),
                                      ]))
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                "Total Price : ${controller.ordersModel.ordersTotalprice}\$",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor2,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ]),
                      ),
                    ),
                    if (controller.ordersModel.ordersType == "0")
                      Card(
                        child: Container(
                            child: ListTile(
                          title: const Text("Shipping Address",
                              style: TextStyle(
                                  color: AppColor.primaryColor2,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}"),
                        )),
                      ),
                    if (controller.ordersModel.ordersType == "0")
                      Card(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: 300,
                          width: double.infinity,
                          child: GoogleMap(
                            mapType: MapType.normal,
                            markers: controller.markers.toSet(),
                            initialCameraPosition: controller.cameraPosition!,
                            onMapCreated: (GoogleMapController controllermap) {
                              controller.completerController!
                                  .complete(controllermap);
                            },
                          ),
                        ),
                      ),
                    if (controller.ordersModel.ordersType == "0")
                      Card(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          // height: 300,
                          width: double.infinity,
                          child: MaterialButton(
                            color: AppColor.thirdColor,
                            onPressed: () {
                              controller.goToDetails(controller.ordersModel);
                             // Get.offNamed(AppRoute.homeAdmin);
                            },
                            child: const Text("Back",
                                style: TextStyle(
                                    color: AppColor.primaryColor2,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                  ]),
                )));
  }
}
