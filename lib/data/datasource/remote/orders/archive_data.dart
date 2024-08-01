import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.ordersarchive, {"id": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
      addretingData(String orderid,String ratind,String comment) async {
    var response = await crud.postData(AppLink.rating, {"id": orderid.toString(),"rating":ratind.toString(),"comment":comment.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
