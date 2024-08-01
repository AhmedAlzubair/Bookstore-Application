import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class PandingData {
  Crud crud;
  PandingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.orderspendingdelivery, {});
    return response.fold((l) => l, (r) => r);
  }
  aproveData(String usersid,String ordersid,String deliveryid) async {
    var response = await crud.postData(AppLink.ordersapprovedelivery, {
      "ordersid":ordersid.toString(),
      "usersid":usersid.toString(),
      "deliveryid":deliveryid.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
