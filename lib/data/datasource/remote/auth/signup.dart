import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username ,String password ,String email ,String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "username" : username.toString() , 
      "password" : password.toString()  , 
      "email" : email.toString() , 
      "phone" : phone.toString()  , 
      // "type":type.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
}
