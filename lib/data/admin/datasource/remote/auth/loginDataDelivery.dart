import 'package:bookstoreapplication/core/class/crud.dart';

//import '../../../../../core/delivery/class/crud.dart';

import '../../../../../linkapi.dart';

class LoginDataDelivery {
  Crud crud;
  LoginDataDelivery(this.crud);
  getData(String email, String password)async {
     var response = await crud.postData(AppLink.loginDelivery, {
      "email" : email.toString() , 
      "password" : password.toString()   
    });
    return response.fold((l) => l, (r) => r);
  }
}
