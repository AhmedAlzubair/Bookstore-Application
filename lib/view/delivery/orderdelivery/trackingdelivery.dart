import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../../../controller/delivery/order/trackingController.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';

class TrackingDelivery extends StatelessWidget {
  const TrackingDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingControllerImp());
    return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Order Tracking",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: AppColor.primaryColor2),
              ),
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: GetBuilder<TrackingControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
             widget:  Column(
            children: [
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10),
                         // height: 300,
                          width: double.infinity,
                          child: GoogleMap(
                            polylines: controller.polylineset,
                            mapType: MapType.normal,
                            markers: controller.markers.toSet(),
                            initialCameraPosition: controller.cameraPosition!,
                            onMapCreated: (GoogleMapController controllermap) {
                              controller.gcm = controllermap;
                            },
                          ),
                        ),
                    ),
                    Container(
                      padding:
                         const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                     // height: 300,
                      width: double.infinity,
                      child:    MaterialButton(
                      color: AppColor.thirdColor,
                      onPressed: () {
                      // controller.goToDetails(controller.ordersModel);
                      },
                      child:const Text("Done",
                          style: TextStyle(
                              color: AppColor.primaryColor2,
                              fontWeight: FontWeight.bold)),
                    ),
                    ),
                   ] ),
                  ),
        ),
              ),
            );
  }
}
