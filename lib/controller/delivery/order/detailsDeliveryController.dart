import 'dart:async';

import 'package:bookstoreapplication/core/class/statusrequest.dart';
//import 'package:bookstoreapplication/core/delivery/functions/handlingData.dart';
import 'package:bookstoreapplication/core/services/services.dart';
import 'package:bookstoreapplication/data/model/cartModel2.dart';
import 'package:bookstoreapplication/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/constant/routes.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../data/delivery/datasource/remote/order/detailsDeliveryData.dart';

class DetailsDeliveryControllerImp extends GetxController {
  DetailsDeliveryData data = DetailsDeliveryData(Get.find());
  MyServices myServices = Get.find();
  List<CartModel2> card = [];
  late OrdersModel ordersModel;
  List<Marker> markers = [];
  double? lat;
  double? long;
  late CameraPosition cameraPosition;
  Completer<GoogleMapController>? completerController;
  StatusRequest statusRequest = StatusRequest.none;
  intialData() {
    if (ordersModel.ordersType == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!)),
        zoom: 14.4746,
      );
      markers.add(Marker(
          markerId: MarkerId("1"),
          position: LatLng(double.parse(ordersModel.addressLat!),
              double.parse(ordersModel.addressLong!))));
    }
  }



  getData() async {
    card.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await data.getData(ordersModel.ordersId!);
    print("=========================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List cardata = response['data'];
        card.addAll(cardata.map((e) => CartModel2.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
     goToDetails(OrdersModel ordersModel) {
    Get.toNamed(AppRoute.trackingDelivery,
        arguments: {"ordersmodel": ordersModel});
  }

    @override
  void onInit() {
    // TODO: implement onInit
    completerController = Completer<GoogleMapController>();
    ordersModel = Get.arguments['ordersmodel'];
    intialData();
    getData();
    super.onInit();
  }
}
