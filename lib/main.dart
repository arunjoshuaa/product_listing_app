import 'package:flutter/material.dart';
import 'package:product_listing_app/config/app_router.dart';
import 'package:product_listing_app/screens/splash_screen.dart';

const _primaryColor = Color(0xFF5E5BE2);
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme:     ThemeData(
        useMaterial3: true,
        // Define a `ColorScheme` from your primary color.
        colorScheme: ColorScheme.fromSeed(
          seedColor: _primaryColor,
          // Your primary color is also the color for selected items.
          primary: _primaryColor,
        ),
        // Style your elevated buttons globally.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _primaryColor, // Sets button background color
            foregroundColor: Colors.white, // Sets button text color
          ),
        ),

        // Style your bottom navigation bar globally.
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: _primaryColor, // Selected icon and label color
          unselectedItemColor: Colors.grey, // Unselected icon and label color
        ),
      ),
    );
  }
}