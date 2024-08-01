import 'dart:io';

import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class HomeAdminCategoriesData {
  Crud crud;
  HomeAdminCategoriesData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewcategories, {});
    return response.fold((l) => l, (r) => r);
  }
  getDataCat(String catid) async {
    var response = await crud.postData(AppLink.viewcategoriespro, {"id":catid.toString()});
    return response.fold((l) => l, (r) => r);
  }
  getDataSer() async {
    var response = await crud.postData(AppLink.viewservices, {});
    return response.fold((l) => l, (r) => r);
  }


  editData(Map data,File? file) async {

    var response = await crud.addRequestWithImage(AppLink.editcategories, data,file);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id, String imageold) async {
    var response = await crud.postData(AppLink.deletecategories,
        {"id": id.toString(), "imagename": imageold.toString()});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data,File? myfile) async {
    //var response = await crud.postData(AppLink.addservices, {});
        var response = await crud.addRequestWithImage(AppLink.addcategories, data,myfile);
    return response.fold((l) => l, (r) => r);
  }



  searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
