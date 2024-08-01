import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:bookstoreapplication/core/functions/handingdatacontroller.dart';
import 'package:bookstoreapplication/core/services/services.dart';
import 'package:bookstoreapplication/data/datasource/remote/address_data.dart';
import 'package:bookstoreapplication/data/datasource/remote/checkout_date.dart';
import 'package:bookstoreapplication/data/model/addressmodel.dart';

import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String addressid = "0";

  late String couponid;
  late String coupondiscount;
  late String priceorders;
  String? userid;
  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData.getData(userid!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.success;
      }
      // End
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a order Type");
    }

    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": userid.toString(),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders.toString(),
      "couponid": couponid.toString(),
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString()
    };
    // PaypalCheckout(
    //   sandboxMode: true,
    //   clientId:
    //       "AcLB4ATipSU15qbh17ciYKsV6DbGvsGu45nD5FLel0OKulSqQoc_D3HEvTKATxhdEL_WoLSkJG8EVO_5",
    //   secretKey:
    //       "EE9BsC97Hped1Wsd8tj2P31o9bFNH42EkmY-arcphm3kYDQzRaW8E59SzONmz9yFHuqG107OVztd4DOk",
    //   returnURL: "success.snippetcoder.com",
    //   cancelURL: "cancel.snippetcoder.com",
    //   transactions: const [
    //     {
    //       "amount": {
    //         "total": '70',
    //         "currency": "USD",
    //         "details": {
    //           "subtotal": '70',
    //           "shipping": '0',
    //           "shipping_discount": 0
    //         }
    //       },
    //       "description": "The payment transaction description.",
    //       // "payment_options": {
    //       //   "allowed_payment_method":
    //       //       "INSTANT_FUNDING_SOURCE"
    //       // },
    //       "item_list": {
    //         "items": [
    //           {"name": "Apple", "quantity": 4, "price": '5', "currency": "USD"},
    //           {
    //             "name": "Pineapple",
    //             "quantity": 5,
    //             "price": '10',
    //             "currency": "USD"
    //           }
    //         ],
    //
    //         // shipping address is not required though
    //         //   "shipping_address": {
    //         //     "recipient_name": "Raman Singh",
    //         //     "line1": "Delhi",
    //         //     "line2": "",
    //         //     "city": "Delhi",
    //         //     "country_code": "IN",
    //         //     "postal_code": "11001",
    //         //     "phone": "+00000000",
    //         //     "state": "Texas"
    //         //  },
    //       }
    //     }
    //   ],
    //   note: "Contact us for any questions on your order.",
    //   onSuccess: (Map params) async {
    //     print("onSuccess: $params");
    //   },
    //   onError: (error) {
    //     print("onError: $error");
    //    // Navigator.pop(context);
    //     Get.close(1);
    //   },
    //   onCancel: () {
    //     print('cancelled:');
    //   },
    // );

    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homescreen);
        Get.snackbar("Success", "the order was successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    userid = myServices.sharedPreferences.getString("userid")!;

    getShippingAddress();
    super.onInit();
  }
}
