import 'package:bookstoreapplication/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtomService extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
 final  bool? myfile;
  const CustomButtomService({super.key, required this.text, this.onPressed,  this.myfile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color:myfile== null || myfile == false  ? AppColor.primaryColor:Colors.green,
        textColor: Colors.white,
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
