import 'package:bookstoreapplication/core/constant/routes.dart';
import 'package:bookstoreapplication/core/middleware/mymiddleware.dart';

import 'package:bookstoreapplication/view/admin/categories/addCat.dart';
import 'package:bookstoreapplication/view/admin/categories/editCat.dart';
import 'package:bookstoreapplication/view/admin/categories/viewCat.dart';
//import 'package:bookstoreapplication/view/admin/categories/viewCatPro.dart';
import 'package:bookstoreapplication/view/admin/homeAdmin.dart';
import 'package:bookstoreapplication/view/admin/homeadminScreen.dart';
import 'package:bookstoreapplication/view/admin/orders/adminOrderpending.dart';
import 'package:bookstoreapplication/view/admin/orders/adminViewOrdersScreen.dart';
import 'package:bookstoreapplication/view/admin/orders/admindetailsorders.dart';
import 'package:bookstoreapplication/view/admin/books/addPro.dart';
import 'package:bookstoreapplication/view/admin/books/editPro.dart';
import 'package:bookstoreapplication/view/admin/books/viewPro.dart';

import 'package:bookstoreapplication/view/admin/publisher/add.dart';
import 'package:bookstoreapplication/view/admin/publisher/edit.dart';
import 'package:bookstoreapplication/view/admin/publisher/view.dart';
import 'package:bookstoreapplication/view/admin/publisher/viewServCat.dart';
import 'package:bookstoreapplication/view/delivery/orderdelivery/aproveorder.dart';
import 'package:bookstoreapplication/view/delivery/orderdelivery/detailsDelivery.dart';
import 'package:bookstoreapplication/view/delivery/orderdelivery/pending.dart';
import 'package:bookstoreapplication/view/delivery/orderdelivery/trackingdelivery.dart';
import 'package:bookstoreapplication/view/delivery/screen/homeScreen.dart';
import 'package:bookstoreapplication/view/screen/catogreiesServHome.dart';
import 'package:bookstoreapplication/view/screen/address/add.dart';
import 'package:bookstoreapplication/view/screen/address/adddetails.dart';
import 'package:bookstoreapplication/view/screen/address/view.dart';
import 'package:bookstoreapplication/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:bookstoreapplication/view/screen/auth/login.dart';
import 'package:bookstoreapplication/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:bookstoreapplication/view/screen/auth/signup.dart';
import 'package:bookstoreapplication/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:bookstoreapplication/view/screen/auth/success_signup.dart';
import 'package:bookstoreapplication/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:bookstoreapplication/view/screen/auth/verifycodesignup.dart';
import 'package:bookstoreapplication/view/screen/cart.dart';
import 'package:bookstoreapplication/view/screen/checkout.dart';
import 'package:bookstoreapplication/view/screen/home.dart'; 
import 'package:bookstoreapplication/view/screen/homescreen.dart';
import 'package:bookstoreapplication/view/screen/items.dart';
import 'package:bookstoreapplication/view/screen/language.dart';
import 'package:bookstoreapplication/view/screen/myfavorite.dart';
import 'package:bookstoreapplication/view/screen/notification.dart';
import 'package:bookstoreapplication/view/screen/officer/officer.dart';
import 'package:bookstoreapplication/view/screen/onboarding.dart';
import 'package:bookstoreapplication/view/screen/orders/archive.dart';
import 'package:bookstoreapplication/view/screen/orders/details.dart';
import 'package:bookstoreapplication/view/screen/orders/pending.dart';
import 'package:bookstoreapplication/view/screen/orders/trackingUserOrder.dart';
import 'package:bookstoreapplication/view/screen/productdetails.dart';
import 'package:get/get.dart';

import 'view/admin/users/add.dart';
import 'view/admin/users/edit.dart';
import 'view/admin/users/viewUser.dart';



List<GetPage<dynamic>>? routes = [
 // GetPage(name: "/", page: () => const HomeScreen()),
 GetPage( name: "/", page: () => const Language(),middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () =>   TestView()),
  GetPage( name:AppRoute.language, page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
 // GetPage(name:AppRoute.RestorantPage , page: () => const RestorantPage()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  // GetPage(name: AppRoute.checkoutPage, page: () => const CheckoutPage()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homeCategoriers, page: () => const HomeCategoriers()),
  GetPage(name: AppRoute.homescreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
    GetPage(name: AppRoute.officer, page: () => const Officer()),
  //
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.trackingUserOrder, page: () => const TrackingUserOrder()),
 ///////////////Adress
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()), 
////////////////notification
 GetPage(name:AppRoute.notificationView , page: () => const NotificationView()),
////////////////////Delivery/////
 GetPage(name:AppRoute.homeScreenDelivery , page: () => const HomeScreenDelivery()),

 GetPage(name: AppRoute.pandingScreen, page: () => const PandingScreen()),
 GetPage(name: AppRoute.aproveScreen, page: () => const AproveScreen()),
  GetPage(name: AppRoute.detailsDelivery, page: () => const DetailsDelivery()),
  GetPage(name: AppRoute.trackingDelivery, page: () => const TrackingDelivery()),
////////////Admin
  GetPage(name: AppRoute.homeAdmin, page: () => const HomeAdmin()),
  GetPage(name: AppRoute.homeAdminScreen, page: () => const HomeAdminScreen()),
/////////////////Services Admin
  GetPage(name: AppRoute.homePublisherAdminView, page: () => const HomePublisherAdminView()),
  GetPage(name: AppRoute.homePublisherAdminEdit, page: () => const HomePublisherAdminEdit()),
  //GetPage(name: AppRoute.homeServesAdminDelete, page: () => const HomeServesAdminView()),
  GetPage(name: AppRoute.homePublisherAdminAdd, page: () => const HomePublisherAdminAdd()),
 // GetPage(name: AppRoute.servesCategoriesAdminView, page: () => const ServesCategoriesAdminView()),
/////////////////Categories Admin
  GetPage(name: AppRoute.homeCategoriesAdminView, page: () => const HomeCategoriesAdminView()),
  GetPage(name: AppRoute.homeCategoriesAdminEdit, page: () => const HomeCategoriesAdminEdit()),
  //GetPage(name: AppRoute.homeServesAdminDelete, page: () => const HomeServesAdminView()),
  GetPage(name: AppRoute.homeCategoriesAdminAdd, page: () => const HomeCategoriesAdminAdd()),
 // GetPage(name: AppRoute.categoriesProductView, page: () => const CategoriesProductView()),
/////////////////Products Admin
  GetPage(name: AppRoute.homeProductsAdminView, page: () => const HomeProductsAdminView()),
  GetPage(name: AppRoute.homeProductsAdminEdit, page: () => const HomeProductsAdminEdit()),
  //GetPage(name: AppRoute.homeServesAdminDelete, page: () => const HomeServesAdminView()),
  GetPage(name: AppRoute.homeProductsAdminAdd, page: () => const HomeProductsAdminAdd()),
  //GetPage(name: AppRoute.homeCategoriesAdminAdd, page: () => const HomeCategoriesAdminAdd()),
/////////////////Orders Admin
  GetPage(name: AppRoute.adminViewOrders, page: () => const AdminViewOrdersScreen()),
  GetPage(name: AppRoute.adminpandingOrders, page: () => const AdminOrderPandingScreen()),
  GetPage(name: AppRoute.admindetailsOrders, page: () => const AdminDetailsOrders()),
/////////////////Users Admin
  GetPage(name: AppRoute.homeUsersAdminView, page: () => const HomeUsersAdminView()),
  GetPage(name: AppRoute.homeUsersAdminAdd, page: () => const SignUpUser()),
  GetPage(name: AppRoute.homeUsersAdminEdit, page: () => const EditSignUpUser()),
 // GetPage(name: AppRoute.adminTrackingOrders, page: () => const AdminTracking()),
];
