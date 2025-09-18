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
    GoRoute(path: '/otp',builder: (context, state) {
      final data=state.extra as Map<String,dynamic>?;
      final phoneNumber=data?['phoneNumber'];
          final otp = data?['otp'] ?? '';
    final user = data?['user'] ?? false;
    return OtpScreen(phoneNumber: phoneNumber,otp: otp,isuser:user);

    },),
    GoRoute(path: '/register',builder: (context, state) {
      final phoneNumber=state.extra as String;
      return RegisterNameScreen(phoneNumber: phoneNumber,);}),
    GoRoute(path: '/home',builder: (context, state) => HomeScreen(),),
    GoRoute(path: '/navbar',builder: (context, state) => CustomBottomNavbarWidget(),)
  ]);