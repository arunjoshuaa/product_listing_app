import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   Material(
          elevation: 5.0, // Set elevation to create the elevated effect
          borderRadius: BorderRadius.circular(8), // Optional: Round corners
          color: Colors.white, // Set background color for the elevated box
          child: SizedBox(
            height: 60,width: 60,
            child: IconButton(
              icon: Icon(Icons.arrow_back), // Your icon here
              onPressed: () {
                // Add the navigation logic here
                context.pop(); // Assuming context.pop() is part of the navigation system (like `go_router`)
              },
              iconSize: 30,
            ),
          ),
        );
  }
}