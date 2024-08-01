import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/services/services.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';
import '../../../core/functions/handingdatacontroller.dart';

import '../../../data/admin/datasource/remote/order/aproveData.dart';

import '../../../data/model/ordersmodel.dart';

class OrderAdminControllerImp extends GetxController {
  AproveAdminData orderdata = AproveAdminData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

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

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  getData() async {
    order.clear();
    Map map = {"orders_status": "0"};
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderdata.getData(map);
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



  aproveData(String userid, String orderid) async {
    order.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderdata.approveData(orderid, userid);
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
