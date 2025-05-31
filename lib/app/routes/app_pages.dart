


import 'package:base_project/presentation/modules/home/bindings/home_binding.dart';
import 'package:base_project/presentation/modules/main_parent/bindings/main_bindings.dart';
import 'package:base_project/presentation/modules/main_parent/views/main_parent_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../presentation/modules/authentication/bindings/login_binding.dart';
import '../../presentation/modules/authentication/bindings/otp_verification_binding.dart';
import '../../presentation/modules/authentication/views/login_screen.dart';
import '../../presentation/modules/authentication/views/otp_verification_screen.dart';
import '../../presentation/modules/home/views/live_matches_screen.dart';
import '../../presentation/modules/home/views/upcoming_matches_screen.dart';
import '../../presentation/modules/splash/bindings/on_boarding_binding.dart';
import '../../presentation/modules/splash/bindings/splash_binding.dart';
import '../../presentation/modules/splash/views/on_boarding_screen.dart';
import '../../presentation/modules/splash/views/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.splashRoute;

  static final routes = [
    GetPage(
      name: AppRoutes.splashRoute,
      page: () => SplashScreen(),
      bindings: [SplashBinding()],
    ),
    GetPage(
      name: AppRoutes.onBoardingRoute,
      page: () => OnBoardingScreen(),
      bindings: [OnBoardingBinding()],
    ),

    GetPage(
      name: AppRoutes.loginRoute,
      page: () => LoginScreen(),
      bindings: [LoginBinding()],
    ),

    GetPage(
      name: AppRoutes.otpVerificationRoute,
      page: () => OtpVerificationScreen(),
      bindings: [OtpVerificationBinding()],
    ),
    GetPage(
      name: AppRoutes.mainParentRoute,
      page: () => MainParentScreen(),
      bindings: [MainParentBindings()],
    ),

    GetPage(
      name: AppRoutes.liveMatchesScreenRoute,
      page: () => LiveMatchesScreen(),
      bindings: [HomeBinding()],
    ),

    GetPage(
      name: AppRoutes.upcomingMatchesScreenRoute,
      page: () => UpcomingMatchesScreen(),
      bindings: [HomeBinding()],
    ),


  ];
}
