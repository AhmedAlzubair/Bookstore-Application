import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.itemsview3, 
    {"userid": usersid.toString(), "catid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }
  getData3( String itemsid) async {
    var response = await crud.postData(AppLink.itemsview2, 
    { "catid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }
  getData2() async {
    var response = await crud.postData(AppLink.itemsview2, 
    {});
    return response.fold((l) => l, (r) => r);
  }
    searchData(String search) async {
    var response = await crud.postData(AppLink.searchbook, {"search": search.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
