import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.catogreies, {});
    return response.fold((l) => l, (r) => r);
  }
   getDataCat(int serid) async {
    var response = await crud.postData(AppLink.catogreies, {"serveid":serid.toString()});
    return response.fold((l) => l, (r) => r);
  }
     getDataserves() async {
    var response = await crud.postData(AppLink.itemserves, {});
    return response.fold((l) => l, (r) => r);
  }
  //   getDataSer(String usersid, String itemsid) async {
  //   var response = await crud.postData(AppLink.itemsview, 
  //   {"userid": usersid, "productid": itemsid});
  //   return response.fold((l) => l, (r) => r);
  // }

  searchData(String search) async {
    var response = await crud.postData(AppLink.searchCat, {"search": search.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
