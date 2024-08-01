import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class PandingAdminData {
  Crud crud;
  PandingAdminData(this.crud);
 
   getData(Map data) async {
    var response = await crud.postData(
        AppLink.ordersViewSAdmin, data);
    return response.fold((l) => l, (r) => r);
  }
  // aproveData(String usersid,String ordersid,String deliveryid) async {
  //   var response = await crud.postData(AppLink.ordersapprovedelivery, {
  //     "ordersid":ordersid.toString(),
  //     "usersid":usersid.toString(),
  //     "deliveryid":deliveryid.toString()
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }
    prepareData(String orderid,String userid,String ordertype) async {
    var response = await crud.postData(
        AppLink.ordersprepareAdmin, {"ordersid": orderid.toString(),"usersid":userid.toString(),"ordertype":ordertype.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
