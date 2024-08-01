import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
  
  //  await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //        apiKey: "AIzaSyDR1jaZQ5VNTq-sAhbLDygPweCDTvzfp2M",
  //        authDomain: "ecommercapp-ccd91.firebaseapp.com",
  //       projectId: "ecommercapp-ccd91",
  //       storageBucket: "ecommercapp-ccd91.appspot.com",
  //        messagingSenderId: "826157456247",
  //       appId: "1:826157456247:web:12447f658970d77cc19f72",
  //       measurementId: "G-SFVQ3Y75RB"
  //    )
  //  );
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
