


 import 'package:base_project/presentation/modules/home/views/match_score_screen.dart';
import 'package:base_project/presentation/modules/home/views/leaderboard_winning_result_screen.dart';
import 'package:base_project/presentation/modules/home/views/term_and_condition.dart';
import 'package:base_project/presentation/modules/main_parent/bindings/main_bindings.dart';
import 'package:base_project/presentation/modules/main_parent/views/main_parent_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../presentation/modules/authentication/bindings/login_binding.dart';
import '../../presentation/modules/authentication/bindings/otp_verification_binding.dart';
import '../../presentation/modules/authentication/views/login_screen.dart';
import '../../presentation/modules/authentication/views/otp_verification_screen.dart';
import '../../presentation/modules/authentication/views/register_screen.dart';
 import '../../presentation/modules/home/bindings/home_binding.dart';
import '../../presentation/modules/home/views/about_us.dart';
import '../../presentation/modules/home/views/add_amount_wallet.dart';
import '../../presentation/modules/home/views/contest_list_screen.dart';
import '../../presentation/modules/home/views/help_and_support.dart';
import '../../presentation/modules/home/views/live_matches_screen.dart';
import '../../presentation/modules/home/views/match_detail_category_screen.dart';
import '../../presentation/modules/home/views/my_info_screen.dart';
import '../../presentation/modules/home/views/my_winnings.dart';
import '../../presentation/modules/home/views/over_ball_selection_result_screen.dart';
import '../../presentation/modules/home/views/over_ball_selection_screen.dart';
import '../../presentation/modules/home/views/transaction_history.dart';
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
      name: AppRoutes.signupRoute,
      page: () => RegisterScreen(),
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

    GetPage(
      name: AppRoutes.overBallSelectionScreenRoute,
      page: () => OverBallSelectionScreen(),
      bindings: [HomeBinding()],
    ),

    GetPage(
      name: AppRoutes.overBallSelectionResultScreenRoute,
      page: () => OverBallSelectionResultScreen(),
      bindings: [HomeBinding()],
    ),


    GetPage(
      name: AppRoutes.contestListScreenRoute,
      page: () => ContestListScreen(),
      bindings: [HomeBinding()],
    ),

    GetPage(
      name: AppRoutes.matchScoreScreenRoute,
      page: () => MatchScoreScreen(),
      bindings: [HomeBinding()],
    ),

    GetPage(
      name: AppRoutes.matchDetailCategoryScreenRoute,
      page: () => MatchDetailCategoryScreen(),
      bindings: [HomeBinding()],
    ),

    GetPage(
      name: AppRoutes.leaderboardWinningResultScreenRoute,
      page: () => LeaderboardWinningResultScreen(),
      bindings: [HomeBinding()],
    ),

    GetPage(
      name: AppRoutes.helpAndSupportRoute,
      page: () => HelpAndSupport(),
      bindings: [HomeBinding()],
    ),

    GetPage(
      name: AppRoutes.termAndConditionRoute,
      page: () => TermAndCondition(),
      bindings: [HomeBinding()],
    ),

    GetPage(
      name: AppRoutes.aboutUsRoute,
      page: () => AboutUs(),
      bindings: [HomeBinding()],
    ),

    GetPage(
      name: AppRoutes.transactionHistoryRoute,
      page: () => TransactionHistory(),
      bindings: [HomeBinding()],
    ),

    GetPage(
      name: AppRoutes.addAmountWalletRoute,
      page: () => AddAmountWallet(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: AppRoutes.myWinningsRoute,
      page: () => MyWinnings(),
      bindings: [HomeBinding()],
    ),


  ];
}
