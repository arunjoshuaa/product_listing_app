import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_listing_app/screens/widgets/custom_back_button.dart';
import 'package:product_listing_app/screens/widgets/custom_button.dart';

class RegisterNameScreen extends StatefulWidget {
  const RegisterNameScreen({super.key});

  @override
  State<RegisterNameScreen> createState() => _RegisterNameScreenState();
}

class _RegisterNameScreenState extends State<RegisterNameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              children: [
                Row(children: [CustomBackButton()]),
                SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter Full Name"
                  ),
              
                ),
                SizedBox(height: 40,),
                CustomButton(buttonText: "Submit", onPressed:() => context.go('/home'), )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
