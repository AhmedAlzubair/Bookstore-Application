class PublisherModel {
  String? publisherId;
  String? publisherName;
  String? publisherImage;


  PublisherModel.fromJson(Map json) {
    publisherId = json['publisherid'].toString();
    publisherName = json['publisher_name'] ;
    publisherImage=json['publisher_image'] ;

  }


  Map<String, dynamic> toJson() {
    return {
      'publisherid': publisherId,
      'publisher_name': publisherName,
      'publisher_image':publisherImage

    };
  }
}
