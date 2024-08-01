import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/functions/getPolyLine.dart';
import '../../../data/model/ordersmodel.dart';

class TrackingControllerImp extends GetxController {
  StreamSubscription<Position>? streamSubscription;
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
        markerId: MarkerId("dest"),
        position: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!))));
    streamSubscription =
        Geolocator.getPositionStream().listen((Position? position) {
      currlat = position!.latitude;
      currlot = position.longitude;
      print(currlat);
      print(currlot);
      if (gcm != null) {
        gcm!.animateCamera(CameraUpdate.newLatLng(LatLng(currlat!, currlot!)));
      }
      markers.removeWhere((element) => element.markerId.value == "current");
      markers.add(Marker(
          markerId: MarkerId("current"), position: LatLng(currlat!, currlot!)));
      update();
    });
  }

  getPointLine() async {
    lat = double.parse(ordersModel.addressLat!);
    lot = double.parse(ordersModel.addressLong!);
    await Future.delayed(Duration(seconds: 1));
    polylineset = await getPolyLinePoint(currlat, currlot, lat, lot);
    update();
  }

  getLocation() async {
    await Future.delayed(Duration(seconds: 1));
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      FirebaseFirestore.instance
          .collection("delivery")
          .doc(ordersModel.ordersId.toString())
          .set({
        "lat": currlat,
        "lot": currlot,
        "deliveryId": ordersModel.addressUsersid
      });
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    ordersModel = Get.arguments['ordersmodel'];

    getCurrent();
    getPointLine();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    streamSubscription!.cancel();
    markers.clear();
    timer!.cancel();
    super.onClose();
  }
}
