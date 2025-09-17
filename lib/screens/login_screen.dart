import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlink/hyperlink.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:product_listing_app/screens/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
            child: SizedBox(
              child: Column(
                children: [
                  Row(children: [Text("Login",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30),)]),
                  SizedBox(height: 10),
                  Row(children: [Text("Lets Connect with Product App...! ",style: TextStyle(fontWeight: FontWeight.w300))]),
                  SizedBox(height: 20),

                  IntlPhoneField(
                    decoration: InputDecoration(labelText: "Enter Phone"),
                    initialCountryCode: 'IN',
                    onChanged: (number) {
                      print(number.completeNumber);
                    },
                  ),
CustomButton(buttonText: 'Continue',onPressed: () => context.push('/otp'),),
                  SizedBox(height: 25,),
                  HyperLink(
                    textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 10),
                    
                    linkStyle: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      //fontSize: 20,
                    ),
                    text:
                        "By Continuing you accepting the [Terms of Use & Privacy Policy](https://www.google.com)",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
