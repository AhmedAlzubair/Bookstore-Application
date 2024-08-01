import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.favoriteView, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.deletefromfavroite, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
