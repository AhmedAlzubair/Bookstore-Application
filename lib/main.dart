import 'package:bookstoreapplication/bindings/intialbindings.dart';
import 'package:bookstoreapplication/core/localization/translation.dart';
import 'package:bookstoreapplication/core/services/services.dart';
import 'package:bookstoreapplication/routes.dart';
import 'package:bookstoreapplication/view/screen/catogreiesServHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await  Firebase.initializeApp(
  //   options: .
  // );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce Course',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      // routes: routes,
      getPages: routes,
    // home:const PaypalPaymentDemo(),
    );
  }
}
