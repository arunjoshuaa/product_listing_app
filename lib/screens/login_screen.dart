import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlink/hyperlink.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:product_listing_app/blocs/auth/verification/verificarion_state.dart';
import 'package:product_listing_app/blocs/auth/verification/verification_bloc.dart';
import 'package:product_listing_app/blocs/auth/verification/verification_event.dart';
import 'package:product_listing_app/repositories/auth_api_service.dart';
import 'package:product_listing_app/screens/widgets/custom_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController=TextEditingController(text: '0');
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
  
    return BlocProvider(
      create: (_)=>VerificationBloc(verificationApiService: AuthApiService()),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: SizedBox(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(children: [Text("Login",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30),)]),
                      SizedBox(height: 10),
                      Row(children: [Text("Lets Connect with Product App...! ",style: TextStyle(fontWeight: FontWeight.w300))]),
                      SizedBox(height: 20),
                  
                      IntlPhoneField(
                        controller: phoneController,
                        initialValue: "0",
                        validator: (phone) {
                          if(phone!.number.isEmpty){
                            return "Phone Number is required";
                          }
                          return null;
                        },
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(hintText: "Enter Phone"),
                        initialCountryCode: 'IN',
                        onChanged: (number) {
                          print(number.completeNumber);
                        },
                      ),
                           BlocConsumer<VerificationBloc,VerificationState>(
                            listener: (context, state) {
                              if(state is VerificationSuccessState){
                                context.push('/otp',extra: {
                                  "phoneNumber":phoneController.text.trim(),
                                  "otp":state.otp,
                                  "user":state.user
                                });
                              }
                              else if(state is VerificationErrorState){
                               ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),);
                              }
                           },
                           builder: (context, state) {
                             if(state is VerificationLoadingState){
                              return CircularProgressIndicator();
                             }
                                 return CustomButtonWidget(buttonText: 'Continue',onPressed: () { 
                                               if(_formKey.currentState!.validate()){
                                               
                                             context.read<VerificationBloc>().add(VerifyPhoneNumberEvent(phoneController.text.trim()));
                                               }
                                             
                                         
                                                   },);
                           },
                         
                           ),
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
        ),
      ),
    );
  }
}
