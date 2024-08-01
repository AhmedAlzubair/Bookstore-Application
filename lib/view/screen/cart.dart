// ignore_for_file: prefer_const_constructors
import 'package:bookstoreapplication/controller/cart_controller.dart';
import 'package:bookstoreapplication/core/class/handlingdataview.dart';
import 'package:bookstoreapplication/core/constant/color.dart';
import 'package:bookstoreapplication/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:bookstoreapplication/view/widget/cart/customitemscartlist.dart';
import 'package:bookstoreapplication/view/widget/cart/topcardCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return
    Scaffold(
            appBar: AppBar(
              title: Text("My Cart"),
            ),
           
            body:  SingleChildScrollView(
       child: GetBuilder<CartController>(
                builder: ((controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(height: 10),
                            TopCardCart(
                                message:
                                    "You Have ${cartController.totalcountitems} Items in Your List"),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  ...List.generate(
                                    cartController.cart.length,
                                    (index) => CustomItemsCartList(
                                        onAdd: ()  {
                                           cartController
                                              .addCard(cartController.cart[index].bookId!);
                                        // cartController.refreshPage();
                                        },
                                        onRemove: ()  {
                                           cartController.remove(
                                              cartController.cart[index].bookId!);
                                         // cartController.refreshPage();
                                        },
                                        imagename:
                                            "${cartController.cart[index].bookImage}",
                                        name: "${cartController.cart[index].bookName}",
                                        price:
                                            "${cartController.cart[index].bookPrice} \$",
                                        count:
                                            "${cartController.cart[index].countbook}"),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        GetBuilder<CartController>(
                builder: (controller) => BottomNavgationBarCart(
                    shipping: "0",
                    controllercoupon: controller.controllercoupon!,
                    onApplyCoupon: () {
                      controller.checkcoupon();
                    },
                    price: "${cartController.priceorders}",
                    discount: "${controller.discountcoupon}%",
                    totalprice: "${controller.getTotalPrice()}")),
                      ],
                    ))))
       ),
     );
  }
}
