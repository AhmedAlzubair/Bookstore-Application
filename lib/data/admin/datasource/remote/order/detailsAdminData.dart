import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class DetailsAdminOrderData {
  Crud crud;
  DetailsAdminOrderData(this.crud);

   getData(Map data) async {
    var response = await crud.postData(
        AppLink.ordersdetailsAdmin, data);
    return response.fold((l) => l, (r) => r);
  }
  approveData(String orderid,String userid) async {
    var response = await crud.postData(
        AppLink.ordersapproveAdmin, {"ordersid": orderid.toString(),"usersid":userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
  
}
