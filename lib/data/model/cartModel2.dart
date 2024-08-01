class CartModel2 {
  String? bookTotalprice;
  String? countbook;
  String? cartId;
  String? cartUserid;
  String? cartbookid;
  String? cartorder;
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
  String? bookPublisherid;

  CartModel2(
      {this.bookTotalprice,
      this.countbook,
      this.cartId,
      this.cartUserid,
      this.cartbookid,
      this.cartorder,
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
      this.bookPublisherid});

  CartModel2.fromJson(Map json) {
    bookTotalprice = json['bookprice'].toString();
    countbook = json['countbook'].toString();
    cartId = json['cart_id'].toString();
    cartUserid = json['cart_userid'].toString();
    cartbookid = json['cart_bookid'].toString();
    cartorder=json['cart_order'].toString();
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
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['bookprice'] = this.bookTotalprice;
    data['countbook'] = this.countbook;
    data['cart_id'] = this.cartId;
    data['cart_userid'] = this.cartUserid;
    data['cart_bookid'] = this.cartbookid;
    data['cart_order'] = this.cartorder;
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
    return data;
  }
}
