import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class OfficerData {
  Crud crud;
  OfficerData(this.crud);
  getDataOfficer() async {
    var response = await crud.postData(AppLink.officeritem, {});
    return response.fold((l) => l, (r) => r);
  }
}
