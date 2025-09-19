import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:product_listing_app/blocs/auth/register_login/register_login_bloc.dart';
import 'package:product_listing_app/blocs/auth/register_login/register_login_event.dart';
import 'package:product_listing_app/screens/widgets/custom_back_button_widget.dart';
import 'package:product_listing_app/screens/widgets/custom_button_widget.dart';
import 'package:product_listing_app/screens/widgets/otp_field_widget.dart';

class OtpScreen extends StatefulWidget {
final  String phoneNumber;
 final String otp;
 final bool isuser;
   const OtpScreen({super.key,required this.phoneNumber,required this.otp,required this.isuser});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
    final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  int remainingTime = 120;
  Timer? timer;
  //change the time format to MM:SS
  // String get formattedTime {
  //   int minutes = (remainigTime ~/ 60);
  //   int seconds = remainigTime % 60;
  //   return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')} Sec';
  // }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (imer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          timer?.cancel();
           remainingTime = 120;
        }
      });
    });
  }
  @override
  void dispose() {
    _otpController.dispose();
    timer?.cancel();
    super.dispose();
  }

 String? _validateOtp(String? otp) {
    if (otp == null || otp.isEmpty) {
      return 'Please enter your otp';
    }
    if (otp != widget.otp) {
      return 'Pin is incorrect';
    }
      if (otp.length != 4) {
      return 'OTP must be 4 digits';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              children: [
                Row(children: [CustomBackButtonWidget()]),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "OTP VERIFICATION",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Enter the OTP sent to',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: '- ${widget.phoneNumber}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'OTP is ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: widget.otp,
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: OtpFieldWidget(otp: widget.otp,controller: _otpController,validator:_validateOtp,)),
                SizedBox(height: 20),
                Text("00:${remainingTime} Sec"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't receive code ?"),
                    TextButton(
                      onPressed: () {
                        if (remainingTime == 120) {
                          // Start timer only if it's not running
                          startTimer();
                        }
                      },
                      child: Text(
                        "Re-send",
                        style: TextStyle(color: Color(0xFFF00E5A4)),
                      ),
                    ),
                  ],
                ),

                CustomButtonWidget(buttonText: 'Submit',onPressed: () { 
                   if (_formKey.currentState!.validate()) {
                    
                    if(widget.isuser==true){
context.read<RegisterLoginBloc>().add(RegisterLoginSubmitEvent(phoneNumber: widget.phoneNumber, name: ''));

                      context.go('/navbar');

                    }else{
                      context.push('/register',extra: widget.phoneNumber);
                    }
    print("otp valid");
                   }
         else{print("OTP invalid");}
                  },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
