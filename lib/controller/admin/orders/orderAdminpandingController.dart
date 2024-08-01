import 'package:bookstoreapplication/core/class/statusrequest.dart';
//import 'package:bookstoreapplication/core/delivery/functions/handlingData.dart';
import 'package:bookstoreapplication/core/services/services.dart';

import 'package:bookstoreapplication/data/model/ordersmodel.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';
import '../../../core/functions/handingdatacontroller.dart';

import '../../../data/admin/datasource/remote/order/pandingData.dart';

class OrderAdminPandingControllerImp extends GetxController {
  PandingAdminData panding = PandingAdminData(Get.find());
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
    Map map = {"orders_status": "1"};
    var response = await panding.getData(map);
    print("=================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List data = response['data'];

        order.addAll(data.map((e) => OrdersModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }



  prepareData(String orderid, String userid, String ordertype) async {
    order.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await panding.prepareData(orderid, userid, ordertype);
    print("=================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // List data = response['data'];
        // order.addAll(data.map((e) => OrdersModel.fromJson(e)));
        refrehOrder();
      }
    } else {
      //statusRequest = StatusRequest.failure;
    }
    update();
  }

  goToDetails(OrdersModel ordersModel) {
    Get.toNamed(AppRoute.admindetailsOrders,
        arguments: {"ordersmodel": ordersModel});
  }

  refrehOrder() {
    getData();
  }

    @override
  void onInit() {
    // TODO: implement onInit
    // deliveryid = myServices.sharedPreferences.getString("deliveryid");

    getData();
    super.onInit();
  }
}
