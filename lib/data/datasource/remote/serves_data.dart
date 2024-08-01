

import '../../../core/Class/crud.dart';
import '../../../linkapi.dart';

class ServesDataa {
  Crud crud;
  ServesDataa(this.crud);

    getData() async {
    var response = await crud.postData(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }
}
