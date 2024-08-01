import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class HomeAdminUsersData {
  Crud crud;
  HomeAdminUsersData(this.crud);
   getData() async {
    var response = await crud.postData(AppLink.viewuser, {});
    return response.fold((l) => l, (r) => r);
  }
}
