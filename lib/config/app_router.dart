import 'package:go_router/go_router.dart';
import 'package:product_listing_app/screens/home_screen.dart';
import 'package:product_listing_app/screens/login_screen.dart';
import 'package:product_listing_app/screens/otp_screen.dart';
import 'package:product_listing_app/screens/register_name_screen.dart';
import 'package:product_listing_app/screens/splash_screen.dart';
import 'package:product_listing_app/screens/widgets/custom_bottom_navbar_widget.dart';

final GoRouter router=GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(path: '/',builder:(context, state) => SplashScreen(),
    ),
    GoRoute(path: '/login',builder: (context, state) => LoginScreen(),),
    GoRoute(path: '/otp',builder: (context, state) => OtpScreen(),),
    GoRoute(path: '/register',builder: (context, state) => RegisterNameScreen(),),
    GoRoute(path: '/home',builder: (context, state) => HomeScreen(),),
    GoRoute(path: '/navbar',builder: (context, state) => CustomBottomNavbarWidget(),)
  ]);