import 'package:bookstoreapplication/core/class/crud.dart';
import 'package:bookstoreapplication/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postdata(String email ,String verifycode) async {
    var response = await crud.postData(AppLink.verifycodeforgetpassword, {
      "email" : email.toString() , 
      "verifycode" : verifycode.toString()   
    });
    return response.fold((l) => l, (r) => r);
  }
}
