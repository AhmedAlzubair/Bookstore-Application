class MyFavoriteModel {
  String? favoriteId;
  String? favoriteUserid;
  String? favoritebookid;
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
  // String? userId;

  MyFavoriteModel({
    this.favoriteId,
    this.favoriteUserid,
    this.favoritebookid,
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
    //this.userId
  });

  MyFavoriteModel.fromJson(Map json) {
    favoriteId = json['favorite_id'].toString();
    favoriteUserid = json['favorite_userid'].toString();
    favoritebookid = json['favorite_bookid'].toString();
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
    bookPublisherid = json['book_publisherid']?.toString();
    // userId = json['user_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_userid'] = this.favoriteUserid;
    data['favorite_bookid'] = this.favoritebookid;
    data['book_id'] = this.bookId;
    data['book-name'] = this.bookName;
    // data['book_name_ar'] = this.bookNameAr;
    data['book_desc'] = this.bookDesc;
    //data['book_desc_ar'] = this.bookDescAr;
    data['book_image'] = this.bookImage;
    data['book_count'] = this.bookCount;
    data['book_active'] = this.bookActive;
    data['book_price'] = this.bookPrice;
    data['book_discount'] = this.bookDiscount;
    data['book_data'] = this.bookData;
    data['book_cat'] = this.bookCat;
    data['book_publisherid'] = this.bookPublisherid;
    //data['book_type'] = this.bookType;
    // data['user_id'] = this.userId;
    return data;
  }
}
