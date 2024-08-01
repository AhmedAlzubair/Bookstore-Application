import 'package:bookstoreapplication/core/Class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class HomeServesData {
  Crud crud;
  HomeServesData(this.crud);

    getData() async {
    var response = await crud.postData(AppLink.catogreies, {});
    return response.fold((l) => l, (r) => r);
  }
}