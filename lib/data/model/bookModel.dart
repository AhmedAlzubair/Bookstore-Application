
class BookModel {


  String? bookId;
  String? bookName;
  String? bookDesc;
  String? bookImage;
  String? bookCount;
  String? bookActive;
  String? bookPrice;
  String? bookDiscount;
  String? bookData;
  String? bookCat;
  // String? bookAuthor;
  String? bookPublisherid;
  String? categoriersId;
  String? categoriersName;
  String? categoriersImage;
  String? categoriersDatatime;
  // String? publisherid;
  String? publisherName;
  String? favorite;
  String? bookpricedisount;

  BookModel({
    this.bookId,
    this.bookName,
    this.bookDesc,
    this.bookImage,
    this.bookCount,
    this.bookActive,
    this.bookPrice,
    this.bookDiscount,
    this.bookData,
    this.bookCat,
    // this.bookAuthor,
    this.bookPublisherid,
    this.categoriersId,
    this.categoriersName,
    this.categoriersImage,
    this.categoriersDatatime,
    
    this.publisherName,
    this.favorite,
    this.bookpricedisount,
  });
  BookModel.fromJson(Map json) {
    bookId = json['book_id']?.toString();
    bookName = json['book_name']?.toString();
    bookDesc = json['book_desc']?.toString();
    bookImage = json['book_image']?.toString();
    bookCount = json['book_count']?.toString();
    bookActive = json['book_active']?.toString();
    bookPrice = json['book_price']?.toString();
    bookDiscount = json['book_discount']?.toString();
    bookData = json['book_data']?.toString();
    bookCat = json['book_cat']?.toString();
   // bookAuthor = json['bookAuthor']?.toString();
    bookPublisherid = json['book_publisherid']?.toString();
    categoriersId = json['categoriers_id']?.toString();
    categoriersName = json['categoriers_name']?.toString();
    categoriersImage = json['categoriers_image']?.toString();
    categoriersDatatime = json['categoriers_datatime']?.toString();
    // publisherid = json['publisherid']?.toString();
    publisherName = json['publisher_name']?.toString();
    favorite = json['favorite']?.toString();
    bookpricedisount = json['bookpricedisount']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['book_id'] = bookId;
    data['book_name'] = bookName;
    data['book_desc'] = bookDesc;
    data['book_image'] = bookImage;
    data['book_count'] = bookCount;
    data['book_active'] = bookActive;
    data['book_price'] = bookPrice;
    data['book_discount'] = bookDiscount;
    data['book_data'] = bookData;
    data['book_cat'] = bookCat;
   
    data['book_publisherid'] = bookPublisherid;
    data['categoriers_id'] = categoriersId;
    data['categoriers_name'] = categoriersName;
    data['categoriers_image'] = categoriersImage;
    data['categoriers_datatime'] = categoriersDatatime;
   
    data['publisher_name'] = publisherName;
    data['favorite'] = favorite;
    data['bookpricedisount'] = bookpricedisount;
    return data;
  }
}
