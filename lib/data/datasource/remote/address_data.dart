import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.addressView, {"usersid": usersid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "usersid": usersid.toString(),
      "name": name.toString(),
      "city": city.toString(),
      "street": street.toString(),
      "lat": lat.toString(),
      "long": long.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response =
        await crud.postData(AppLink.addressDelete, {"addressid": addressid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
