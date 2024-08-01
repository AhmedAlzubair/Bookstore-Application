import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/functions/getPolyLine.dart';
import '../../../data/model/ordersmodel.dart';

class TrackingUserControllerImp extends GetxController {
  //StreamSubscription<Position>? streamSubscription;
  GoogleMapController? gcm;
  List<Marker> markers = [];
  Set<Polyline> polylineset = {};
  StatusRequest statusRequest = StatusRequest.success;
  // Position? position;
  CameraPosition? cameraPosition;
  late OrdersModel ordersModel;
  double? lat;
  double? lot;
  double? currlot;
  double? currlat;
  Timer? timer;
  getCurrent() async {
    // position = await Geolocator.getCurrentPosition();
    cameraPosition = CameraPosition(
      zoom: 14.4746,
      target: LatLng(double.parse(ordersModel.addressLat!),
          double.parse(ordersModel.addressLong!)),
    );
    // currlat = position!.latitude;
    // currlot = position!.longitude;
    markers.add(Marker(
        markerId: MarkerId("current"),
        position: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!))));
  }

  getPointLine() async {
    lat = double.parse(ordersModel.addressLat!);
    lot = double.parse(ordersModel.addressLong!);
    await Future.delayed(Duration(seconds: 1));
    polylineset = await getPolyLinePoint(currlat, currlot, lat, lot);
    update();
  }

  getLocation() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(ordersModel.ordersId)
        .snapshots()
        .listen((event) {
      if (event.exists) {
        lat = event.get("lat");
        lot = event.get("lot");
        updateDeliveryLoction(lat!, lot!);
      }
    });
  }

  updateDeliveryLoction(double destlat, double destlot) {
    markers.removeWhere((element) => element.markerId.value == "dest");
    markers.add(
        Marker(markerId: MarkerId("dest"), position: LatLng(destlat, destlot)));
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    ordersModel = Get.arguments['ordersmodel'];

    getCurrent();
    getLocation();
    // getPointLine();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    markers.clear();
    timer!.cancel();
    super.onClose();
  }
}
