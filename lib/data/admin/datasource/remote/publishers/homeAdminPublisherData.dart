import 'dart:io';

import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class HomeAdminPublisherData {
  Crud crud;
  HomeAdminPublisherData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewpublisher, {});
    return response.fold((l) => l, (r) => r);
  }
 

  editDataPub(Map data,File? myfile) async {
    var response =  await crud.addRequestWithImage(AppLink.editpublisher, data,myfile);
    return response.fold((l) => l, (r) => r);
  }

  deleteDataPub(String id,String imageId) async {
    var response = await crud.postData(AppLink.deletepublisher,
        {"id": id.toString(),"imagename":imageId.toString()});
    return response.fold((l) => l, (r) => r);
  }

  addDataPub(Map data,File? myfile) async {
        var response =  await crud.addRequestWithImage(AppLink.addpublisher, data,myfile);
    return response.fold((l) => l, (r) => r);
  }


  searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
