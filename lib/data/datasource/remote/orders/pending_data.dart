import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.pendingorders, {"id": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String orderid) async {
    var response = await crud.postData(AppLink.ordersdelete, {"id": orderid.toString()});
    return response.fold((l) => l, (r) => r);
  }
    addretingData(String userid,String ratind,String comment) async {
    var response = await crud.postData(AppLink.pendingorders, {"id": userid.toString(),"rating":ratind.toString(),"comment":comment.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
