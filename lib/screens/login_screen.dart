import 'package:flutter/material.dart';
import 'package:hyperlink/hyperlink.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(onPressed: () {}, child: Text("Continue"),style: ElevatedButton.styleFrom(
                 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))),),),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
                    child: HyperLink(
                      textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),
                      
                      linkStyle: TextStyle(
                        
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        //fontSize: 20,
                      ),
                      text:
                          "By Continuing you accepting the [Terms of Use & Privacy Policy](https://www.google.com)",
                    ),
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
