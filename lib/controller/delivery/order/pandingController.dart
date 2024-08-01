import 'package:bookstoreapplication/core/class/statusrequest.dart';
//import 'package:bookstoreapplication/core/delivery/functions/handlingData.dart';
import 'package:bookstoreapplication/core/services/services.dart';
import 'package:bookstoreapplication/data/delivery/datasource/remote/order/pandingData.dart';
import 'package:bookstoreapplication/data/model/ordersmodel.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';
import '../../../core/functions/handingdatacontroller.dart';

class PandingControllerImp extends GetxController {
  PandingData panding = PandingData(Get.find());
  MyServices myServices = Get.find();
  List<OrdersModel> order = [];
  String? type;
  String? pyment;
  String? deliveryid;
  String printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  StatusRequest statusRequest = StatusRequest.none;

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  getData() async {
    order.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await panding.getData();
    print("=================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List data = response['data'];
        order.addAll(data.map((e) => OrdersModel.fromJson(e)));
      }
    } else {
      //statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    deliveryid = myServices.sharedPreferences.getString("deliveryid");

    getData();
    super.onInit();
  }

  aproveData(String userid, String orderid) async {
    order.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await panding.aproveData(userid, orderid, deliveryid!);
    print("=================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // List data = response['data'];
        // order.addAll(data.map((e) => OrdersModel.fromJson(e)));
        refreshData();
      }
    } else {
      //statusRequest = StatusRequest.failure;
    }
    update();
  }

  refreshData() {
    getData();
  }

  goToDetails(OrdersModel ordersModel) {
    Get.toNamed(AppRoute.detailsDelivery,
        arguments: {"ordersmodel": ordersModel});
  }
}
