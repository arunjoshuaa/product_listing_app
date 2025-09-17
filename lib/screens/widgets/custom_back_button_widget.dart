import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButtonWidget extends StatelessWidget {
  const CustomBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Material(
          elevation: 5.0, 
          borderRadius: BorderRadius.circular(8), 
          color: Colors.white, 
          child: SizedBox(
            height: 60,width: 60,
            child: IconButton(
              icon: Icon(Icons.arrow_back), 
              onPressed: () {
                
                context.pop(); 
              },
              iconSize: 30,
            ),
          ),
        );
  }
}