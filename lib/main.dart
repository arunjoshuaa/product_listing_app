import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/blocs/auth/register_login/register_login_bloc.dart';
import 'package:product_listing_app/blocs/auth/register_login/register_login_event.dart';
import 'package:product_listing_app/blocs/auth/verification/verification_bloc.dart';
import 'package:product_listing_app/blocs/auth/verification/verification_event.dart';
import 'package:product_listing_app/blocs/banner/banner_bloc.dart';
import 'package:product_listing_app/blocs/banner/banner_event.dart';
import 'package:product_listing_app/blocs/product/product_bloc.dart';
import 'package:product_listing_app/blocs/product/product_event.dart';
import 'package:product_listing_app/blocs/search/search_bloc.dart';
import 'package:product_listing_app/blocs/search/search_event.dart';
import 'package:product_listing_app/blocs/user/user_bloc.dart';
import 'package:product_listing_app/blocs/user/user_event.dart';
import 'package:product_listing_app/blocs/wishlist/wishlist_product_bloc.dart';
import 'package:product_listing_app/blocs/wishlist/wishlist_product_event.dart';
import 'package:product_listing_app/config/app_router.dart';
import 'package:product_listing_app/core/storage_service.dart';
import 'package:product_listing_app/repositories/auth_api_service.dart';
import 'package:product_listing_app/repositories/banner_api_service.dart';
import 'package:product_listing_app/repositories/produc_api_service.dart';
import 'package:product_listing_app/repositories/profie_api_service.dart';
import 'package:product_listing_app/repositories/search_api_service.dart';
import 'package:product_listing_app/repositories/wishlist_api_service.dart';
import 'package:product_listing_app/screens/splash_screen.dart';

const _primaryColor = Color(0xFF5E5BE2);
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
     providers: [
      BlocProvider(  create: (context) => ProductBloc(apiService:ProducApiService())..add(FetchProducts()),),
      BlocProvider(create: (context)=>BannerBloc(bannerApiService:BannerApiService())..add(FetchBannersEvent())),
      BlocProvider(create: (context)=>RegisterLoginBloc(registerLoginApiService: AuthApiService(), secureStorageService: SecureStorageService())),
      BlocProvider(  create: (context) => UserBloc(profileApiService: ProfieApiService())..add(FetchUserEvent()),),
            BlocProvider(  create: (context) => WishlistProductBloc(wishlistApiService: WishlistApiService())..add(FetchWishlistProducts()),),
 BlocProvider(
      create: (context) => SearchBloc(searchApiService: SearchApiService()),
  
    )
    
      ],
      child: MaterialApp.router(
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
            backgroundColor: Colors.amber,
            selectedItemColor: _primaryColor, // Selected icon and label color
            unselectedItemColor: Colors.grey, // Unselected icon and label color
          ),
        ),
      ),
    );
  }
}