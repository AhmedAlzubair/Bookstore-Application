import 'package:bookstoreapplication/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtomAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomButtomAuth({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AppColor.primaryColor,
        child: Text(text,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),),
        onPressed: onPressed),
    );
  }
}
