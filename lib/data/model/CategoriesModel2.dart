// class CategoriesModel2 {
//   List<CategoriersModel>? categoriers=[];

//   CategoriesModel2({this.categoriers});

//   CategoriesModel2.fromJson(Map json) {
//     if (json['categoriers'] != null) {
//       //categoriers = new List<Categoriers>();
//       json['categoriers'].forEach((v) {
//         categoriers!.add(new CategoriersModel.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.categoriers != null) {
//       data['categoriers'] = this.categoriers!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class CategoriersModel {
  int? categoriersId;
  String? categoriersName;
  String? categoriersNameAr;
  String? categoriersImage;
  String? categoriersDatatime;
  int? categoriersServes;
  String? categoriersType;
  String? categoriersLowestLimit;
  int? servesId;
  String? servesName;
  String? servesNameAr;
  String? servesImage;

  CategoriersModel(
      {this.categoriersId,
      this.categoriersName,
      this.categoriersNameAr,
      this.categoriersImage,
      this.categoriersDatatime,
      this.categoriersServes,
      this.categoriersType,
      this.categoriersLowestLimit,
      this.servesId,
      this.servesName,
      this.servesNameAr,
      this.servesImage});

  CategoriersModel.fromJson(Map json) {
    categoriersId = json['categoriers_id'];
    categoriersName = json['categoriers_name'];
    categoriersNameAr = json['categoriers_name_ar'];
    categoriersImage = json['categoriers_image'];
    categoriersDatatime = json['categoriers_datatime'];
    categoriersServes = json['categoriers_serves'];
    categoriersType = json['categoriers_type'];
    categoriersLowestLimit = json['categoriers_Lowest limit'].toString();
    servesId = json['serves_id'];
    servesName = json['serves_name'];
    servesNameAr = json['serves_name_ar'];
    servesImage = json['serves_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoriers_id'] = this.categoriersId;
    data['categoriers_name'] = this.categoriersName;
    data['categoriers_name_ar'] = this.categoriersNameAr;
    data['categoriers_image'] = this.categoriersImage;
    data['categoriers_datatime'] = this.categoriersDatatime;
    data['categoriers_serves'] = this.categoriersServes;
    data['categoriers_type'] = this.categoriersType;
    data['categoriers_Lowest limit'] = this.categoriersLowestLimit;
    data['serves_id'] = this.servesId;
    data['serves_name'] = this.servesName;
    data['serves_name_ar'] = this.servesNameAr;
    data['serves_image'] = this.servesImage;
    return data;
  }
}
