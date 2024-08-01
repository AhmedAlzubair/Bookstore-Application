import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

String key = "AIzaSyDR1jaZQ5VNTq-sAhbLDygPweCDTvzfp2M";
getPolyLinePoint(lat, lot, deslat, deslot) async {
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> polylineset = {};
  List<LatLng> polylinecor = [];

  String uri =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$lot&destination=$deslat,$deslot&key=$key";
  var response = await http.post(Uri.parse(uri));
  var responsebody = jsonDecode(response.body);
  var point = responsebody['routes'][0]['overview_polyline']['points'];
  List<PointLatLng> result = polylinePoints.decodePolyline(point);
  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointLatLng) {
      polylinecor.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    });
  }
  Polyline polyline = Polyline(
      polylineId: PolylineId("polyline"),
      points: polylinecor,
      width: 5,
      color: Color(0xff3498db));
  polylineset.add(polyline);
  return polylineset;
}
