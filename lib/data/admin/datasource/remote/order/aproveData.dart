import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class AproveAdminData {
  Crud crud;
  AproveAdminData(this.crud);
  //   getData(String orderdelivery) async {
  //   var response = await crud.postData(AppLink.ordersaccepteddelivery, {"id":orderdelivery.toString()});
  //   return response.fold((l) => l, (r) => r);
  // }
   approveData(String orderid,String userid) async {
    var response = await crud.postData(
        AppLink.ordersapproveAdmin, {"ordersid": orderid.toString(),"usersid":userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
   getData(Map data) async {
    var response = await crud.postData(
        AppLink.ordersViewSAdmin, data);
    return response.fold((l) => l, (r) => r);
  }
  // doneData(String ordersid,String usersid) async {
  //   var response = await crud.postData(AppLink.ordersdonedelivery, {
  //     "ordersid":ordersid.toString(),
  //    // "usersid":usersid.toString(),
  //     "usersid":usersid.toString()
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }
}
