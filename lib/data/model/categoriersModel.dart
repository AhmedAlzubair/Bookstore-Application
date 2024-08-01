class CategoriersModel {
  String? categoriersId;
  String? categoriersName;
  String? categoriersImage;
  String? categoriersDatatime;

  CategoriersModel.fromJson(Map json) {
    categoriersId = json['categoriers_id'].toString() ;
    categoriersName = json['categoriers_name'] ;
    categoriersImage = json['categoriers_image'] ;
    categoriersDatatime = json['categoriers_datatime'] ;
  }


  Map<String, dynamic> toJson() {
    return {
      'categoriers_id': categoriersId,
      'categoriers_name': categoriersName,
      'categoriers_image': categoriersImage,
      'categoriers_datatime': categoriersDatatime,
    };
  }
}
