import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_listing_app/blocs/auth/register_login/register_login_bloc.dart';
import 'package:product_listing_app/blocs/auth/register_login/register_login_event.dart';
import 'package:product_listing_app/screens/widgets/custom_back_button_widget.dart';
import 'package:product_listing_app/screens/widgets/custom_button_widget.dart';

class RegisterNameScreen extends StatefulWidget {
  final String phoneNumber;
  const RegisterNameScreen({super.key,required this.phoneNumber});

  @override
  State<RegisterNameScreen> createState() => _RegisterNameScreenState();
}

class _RegisterNameScreenState extends State<RegisterNameScreen> {
  final formKey=GlobalKey<FormState>();
  final nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              children: [
                Row(children: [CustomBackButtonWidget()]),
                SizedBox(height: 50),
                Form(
                  key: formKey,
                  child: TextFormField(
                    controller: nameController,
                    validator: (name) {
                       if (name == null || nameController.text.trim().isEmpty) {
      return 'Please enter your full name';
    }
        // Check if name contains only alphabets and spaces
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
      return 'Name can contain only alphabets and spaces';
    }
                      
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Full Name"
                    ),
                                
                  ),
                ),
                SizedBox(height: 40,),
           CustomButtonWidget(
        buttonText: "Submit",
        onPressed: () {
          context.read<RegisterLoginBloc>().add(RegisterLoginSubmitEvent(phoneNumber: widget.phoneNumber, name: nameController.text.trim()));
          if (formKey.currentState!.validate()) {
            context.go('/navbar');
          }
        },
      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
