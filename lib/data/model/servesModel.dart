class ServesModel {
  int? servesId;
  String? servesName;
  String? servesNameAr;
  String? servesImage;

  ServesModel(
      {this.servesId, this.servesName, this.servesNameAr, this.servesImage});

  ServesModel.fromJson(Map json) {
    servesId = json['serves_id'];
    servesName = json['serves_name'];
    servesNameAr = json['serves_name_ar'];
    servesImage = json['serves_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serves_id'] = this.servesId;
    data['serves_name'] = this.servesName;
    data['serves_name_ar'] = this.servesNameAr;
    data['serves_image'] = this.servesImage;
    return data;
  }
}