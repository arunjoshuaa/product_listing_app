import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:product_listing_app/screens/home_screen.dart';
import 'package:product_listing_app/screens/profile_screen.dart';
import 'package:product_listing_app/screens/wishlist_screen.dart';
import 'package:line_icons/line_icons.dart';

class CustomBottomNavbarWidget extends StatefulWidget {
  const CustomBottomNavbarWidget({super.key});

  @override
  State<CustomBottomNavbarWidget> createState() =>
      _CustomBottomNavbarWidgetState();
}

class _CustomBottomNavbarWidgetState extends State<CustomBottomNavbarWidget> {
  int index = 0;
  List pages = [HomeScreen(), WishlistScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      extendBody: true, 
      body: Center(
        
        child: pages.elementAt(index),
      ),
      bottomNavigationBar: Stack(
        children: [
          
          Positioned(
            bottom: 30, 
            left: 30, 
            right: 30, 
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: Colors.white,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    duration: Duration(milliseconds: 400),
                    tabBackgroundColor: primaryColor,
                    color: Colors.black,
                    tabs: [
                      GButton(
                        icon: LineIcons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: LineIcons.heart,
                        text: 'Wishlist',
                      ),
                      GButton(
                        icon: LineIcons.user,
                        text: 'Profile',
                      ),
                    ],
                    selectedIndex: index,
                    onTabChange: (currentIndex) {
                      setState(() {
                        index = currentIndex;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
