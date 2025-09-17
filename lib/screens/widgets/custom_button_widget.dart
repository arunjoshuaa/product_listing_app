
import 'package:flutter/material.dart';


class CustomButtonWidget extends StatelessWidget {
  String buttonText;
   VoidCallback onPressed;
   CustomButtonWidget({super.key,required this.buttonText,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return                    SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(onPressed:onPressed,style: ElevatedButton.styleFrom(
                 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))), child: Text(buttonText),),);
  }
}