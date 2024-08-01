import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:bookstoreapplication/core/class/statusrequest.dart';
import 'package:bookstoreapplication/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:path/path.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

// class Crud {
//   Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
//     //,encoding: Encoding.getByName("utf-8") <String,dynamic>

//     var response = await http.post(Uri.parse(linkurl),
//         body: data, encoding: Encoding.getByName("utf-8"));
//     print(response.statusCode);

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       var responsebody = jsonDecode(response.body);
//       // Map responsebody =json.decode(response.body) ;

//       print(responsebody);

//       return Right(responsebody);
//     } else {
//       return const Left(StatusRequest.serverfailure);
//     }
//   }

  Future<Either<StatusRequest, Map>> addRequestWithImage(
      String linkurl, Map data, File? image,
      [String? namerquest]) async {
    if (namerquest == null) {
      namerquest = "files";
    }
    var url = Uri.parse(linkurl);
    var request = http.MultipartRequest("POST", url);
    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      //stream.cast();
      var multiparfile = http.MultipartFile(namerquest, stream, length,
          filename: basename(image.path));
      // request.fields.addAll(multiparfile);
      request.files.add(multiparfile);
    }
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responsebody = jsonDecode(response.body);
      // Map responsebody =json.decode(response.body) ;

      print(responsebody);

      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }

// class Crud {
//   Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {

//         var response = await http.post(Uri.parse(linkurl), body: data);
//           print(response.statusCode) ;

//         if (response.statusCode == 200 || response.statusCode == 201) {
//           Map responsebody = jsonDecode(response.body);
//           print(responsebody) ;

//           return Right(responsebody);
//         } else {
//           return const Left(StatusRequest.serverfailure);
//         }
//       }

//   }
}
