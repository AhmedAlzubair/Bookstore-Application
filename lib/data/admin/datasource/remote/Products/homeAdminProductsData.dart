import 'dart:io';

import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class HomeAdminProductsData {
  Crud crud;
  HomeAdminProductsData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewproduct, {});
    return response.fold((l) => l, (r) => r);
  }
  getDataCat() async {
    var response = await crud.postData(AppLink.viewcategories, {});
    return response.fold((l) => l, (r) => r);
  }
  getDataPub() async {
    var response = await crud.postData(AppLink.viewpublisher, {});
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data,File? file) async {
    var response = await crud.addRequestWithImage(AppLink.editproduct, data,file);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id, String imageold) async {
    var response = await crud.postData(AppLink.deleteproduct,
        {"id": id.toString(), "imagename": imageold.toString()});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data,File? file) async {
    //var response = await crud.postData(AppLink.addservices, {});
        var response = await crud.addRequestWithImage(AppLink.addproduct, data,file);
    return response.fold((l) => l, (r) => r);
  }

  //   getDataSer(String usersid, String itemsid) async {
  //   var response = await crud.postData(AppLink.itemsview,
  //   {"userid": usersid, "productid": itemsid});
  //   return response.fold((l) => l, (r) => r);
  // }

  searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
