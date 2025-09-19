import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/blocs/user/user_bloc.dart';
import 'package:product_listing_app/blocs/user/user_event.dart';
import 'package:product_listing_app/blocs/user/user_state.dart';
import 'package:product_listing_app/models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch user profile when the screen is initialized
    context.read<UserBloc>().add(FetchUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text("My Profile"),
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          // Loading state: Show a loading indicator
          if (state is UserLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          // Error state: Show an error message
          if (state is UserErrorState) {
            return Center(child: Text(state.message));
          }

          // Loaded state: Display the user data
          if (state is UserLoadedState) {
            UserModel user = state.user;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Name Row
                    Row(
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          user.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    // Phone Number Row
                    Row(
                      children: [
                        Text(
                          "Phone",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          user.phoneNumber,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }

          // Default case: If no state is matched, show a message.
          return Center(child: Text('Something went wrong.'));
        },
      ),
    );
  }
}
