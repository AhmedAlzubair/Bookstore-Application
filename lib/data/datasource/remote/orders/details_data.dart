import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.ordersdetails, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
  getData2(String userid,String orderid) async {
    var response = await crud.postData(AppLink.ordersdetails, {"userid": userid.toString(),"orderid":orderid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
