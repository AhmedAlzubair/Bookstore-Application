import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class SignupAdminData {
  Crud crud;
  SignupAdminData(this.crud);
   getData() async {
    var response = await crud.postData(AppLink.viewuser, {});
    return response.fold((l) => l, (r) => r);
  }
  postdata(String username ,String password ,String email ,String phone ,String type) async {
    var response = await crud.postData(AppLink.addAdmin, {
      "username" : username.toString() , 
      "password" : password.toString()  , 
      "email" : email.toString() , 
      "phone" : phone.toString()  , 
      "type":type.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
    editdata(String username ,String password ,String email ,String phone ,String type) async {
    var response = await crud.postData(AppLink.edituser, {
      "username" : username.toString() , 
      "password" : password.toString()  , 
      "email" : email.toString() , 
      "phone" : phone.toString()  , 
      "type":type.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
    deletedata(String userid ) async {
    var response = await crud.postData(AppLink.deleteuser, {
      "userid" : userid.toString() , 
     
    });
    return response.fold((l) => l, (r) => r);
  }
}