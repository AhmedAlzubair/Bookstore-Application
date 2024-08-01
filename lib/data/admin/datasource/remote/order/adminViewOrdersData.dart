import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class AdminViewOrdersData {
  Crud crud;
  AdminViewOrdersData(this.crud);
  approveData(String orderid,String userid) async {
    var response = await crud.postData(
        AppLink.ordersapproveAdmin, {"ordersid": orderid.toString(),"usersid":userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
  prepareData(String orderid,String userid,String ordertype) async {
    var response = await crud.postData(
        AppLink.ordersprepareAdmin, {"ordersid": orderid.toString(),"usersid":userid.toString(),"ordertype":ordertype.toString()});
    return response.fold((l) => l, (r) => r);
  }
  getData(Map data) async {
    var response = await crud.postData(
        AppLink.ordersViewSAdmin, data);
    return response.fold((l) => l, (r) => r);
  }
  getDetialData(Map data) async {
    var response = await crud.postData(
        AppLink.ordersdetailsAdmin, data);
    return response.fold((l) => l, (r) => r);
  }
  getPreData() async {
    var response = await crud.postData(
        AppLink.ordersViewPreAdmin, {});
    return response.fold((l) => l, (r) => r);
  }
  archiveData() async {
    var response = await crud.postData(
        AppLink.ordersarchiveAdmin, {});
    return response.fold((l) => l, (r) => r);
  }
}
