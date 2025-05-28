

import 'package:base_project/app/export.dart';
import 'package:base_project/app/modules/about/bindings/bindings.dart';
// import 'package:base_project/app/modules/customer/home/views/customer_order_details.dart';
import 'package:base_project/app/modules/language/bindings/bindings.dart';
import 'package:base_project/app/modules/language/views/language_screen.dart';
// import 'package:base_project/app/modules/loyality_points/bindings/bindings/loyalty_bindings.dart';
// import 'package:base_project/app/modules/loyality_points/views/loyalty_point_screen.dart';
// import 'package:base_project/app/modules/tracking/binding/bindings.dart';
// import 'package:base_project/app/modules/tracking/views/track_order_detail_screen.dart';
// import 'package:base_project/app/modules/wallet/bindings/bindings.dart';
// import 'package:base_project/app/modules/wallet/views/add_money_screen.dart';
// import 'package:base_project/app/modules/wallet/views/top_up_successful_screen.dart';
// import 'package:base_project/app/modules/wallet/views/wallet_screen.dart';

import '../modules/about/views/about_us_screen.dart';
import '../modules/authentication/bindings/customer_profile_binding.dart';
import '../modules/authentication/views/customer_profile_setup.dart';
// import '../modules/customer/home/bindings/promocode_binding.dart';
import '../modules/support/bindings/support_list_binding.dart';
import '../modules/support/views/support_chat_screen.dart';
// import '../modules/tracking/views/track_order_screen.dart';

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
    // GetPage(
    //   name: AppRoutes.roleSelectionRoute,
    //   page: () => RoleSelectionScreen(),
    //   bindings: [RoleSelectionBinding()],
    // ),
    GetPage(
      name: AppRoutes.loginRoute,
      page: () => LoginScreen(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: AppRoutes.signupRoute,
      page: () => SignUpScreen(),
      bindings: [SignUpBinding()],
    ),
    GetPage(
      name: AppRoutes.otpVerificationRoute,
      page: () => OtpVerificationScreen(),
      bindings: [OtpVerificationBinding()],
    ),
    GetPage(
      name: AppRoutes.forgotPasswordOption,
      page: () => ForgotPasswordOptionScreen(),
      bindings: [ForgotPasswordOptionBinding()],
    ),
    GetPage(
      name: AppRoutes.changePasswordRoute,
      page: () => ChangePasswordScreen(),
      bindings: [ChangePasswordBinding()],
    ),
    GetPage(
      name: AppRoutes.changePasswordRoute,
      page: () => ChangePasswordScreen(),
      bindings: [ChangePasswordBinding()],
    ),
    GetPage(
      name: AppRoutes.forgotPasswordRoute,
      page: () => ForgotPasswordScreen(),
      bindings: [ForgotPasswordBinding()],
    ),
    // GetPage(
    //   name: AppRoutes.editProfileRoute,
    //   page: () => EditProfileScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    GetPage(
      name: AppRoutes.staticPageRoute,
      page: () => StaticPageScreen(),
      bindings: [StaticPageBinding()],
    ),
    GetPage(
      name: AppRoutes.othersRoute,
      page: () => OtherScreen(),
      bindings: [OthersBinding()],
    ),
    GetPage(
      name: AppRoutes.faqRoute,
      page: () => FAQScreen(),
      bindings: [FAQBinding()],
    ),
    GetPage(
      name: AppRoutes.notificationRoute,
      page: () => NotificationScreen(),
      bindings: [NotificationBinding()],
    ),
    GetPage(
      name: AppRoutes.chatRoute,
      page: () => ChatScreen(),
      bindings: [ChatBinding()],
    ),
    // GetPage(
    //   name: AppRoutes.paymentDetailRoute,
    //   page: () => PaymentScreen(),
    //   bindings: [PaymentBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.addBankAccountRoute,
    //   page: () => AddBankAccountScreen(),
    //   bindings: [PaymentBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.ratingReviewRoute,
    //   page: () => RatingReviewScreen(),
    //   bindings: [RatingReviewBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.referralRoute,
    //   page: () => ReferralScreen(),
    //   bindings: [ReferralBinding()],
    // ),

    /*----------------restaurant----------------*/

    /*----------------driver----------------*/

    /*----------------Customer----------------*/
    // GetPage(
    //   name: AppRoutes.customerHomeScreen,
    //   page: () => CustomerHomeScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.restaurantFamilyScreen,
    //   page: () => RestaurantFamilyScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.cloudFamRestDetailScreen,
    //   page: () => CloudFamilyRestDetailScreen(),
    //   bindings: [CloudFamilyBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.courierServiceScreen,
    //   page: () => CourierServiceScreen(),
    //   bindings: [LegRunningBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.receiverDetailsScreen,
    //   page: () => ReceiverDetailsScreen(),
    //   bindings: [LegRunningBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.packageConfirmationScreen,
    //   page: () => PackageConfirmationScreen(),
    //   bindings: [LegRunningBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.aboutPackageScreen,
    //   page: () => AboutPackageScreen(),
    //   bindings: [LegRunningBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.plateDetailsScreen,
    //   page: () => CustomerPlateDetailScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.legRunningHomeScreen,
    //   page: () => LegRunningHomeScreen(),
    //   bindings: [LegRunningBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.filterScreen,
    //   page: () => FilterScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.searchViewScreen,
    //   page: () => SearchViewScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.allRestaurantsScreen,
    //   page: () => AllRestaurantsScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.restaurantDetailScreen,
    //   page: () => RestaurantDetailScreen(),
    //   bindings: [RestDetailBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.storesMallsListScreen,
    //   page: () => StoresMallsListScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.martDetailScreen,
    //   page: () => MartDetailScreen(),
    //   bindings: [MartDetailBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.productsListScreen,
    //   page: () => FreshFoodsProductsListScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.cloudFamilyMealScreen,
    //   page: () => CloudFamChooseMealScreen(),
    //   bindings: [CloudFamilyBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.chooseScreen,
    //   page: () => CloudFamOrderTypeScreen(),
    //   bindings: [CloudFamilyBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.orderCartScreen,
    //   page: () => OrderCartScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.cloudFamilyRestaurant,
    //   page: () => CloudFamilyRestaurantScreen(),
    //   bindings: [CloudFamilyBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.addressListScreen,
    //   page: () => AddressListScreen(),
    //   bindings: [AdressBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.addAddressScreen,
    //   page: () => AddAddressScreen(),
    //   bindings: [AdressBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.orderNowScreen,
    //   page: () => OrderNowScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.customerMainScreen,
    //   page: () => CustomerMainScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.customerOrdersScreen,
    //   page: () => CustomerOrdersScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.orderDetailsScreen,
    //   page: () => OrderDetailsScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.orderDetailMapScreen,
    //   page: () => OrderDetailMapScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.customerTrackOrderScreen,
    //   page: () => CustomerTrackOrderScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.customerRateUsScreen,
    //   page: () => CustomerRateUsScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.customerFavouritesScreen,
    //   page: () => CustomerFavouritesScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.runningErrandsScreen,
    //   page: () => RunningErrandsScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.customerProfileHomeScreen,
    //   page: () => CustomerProfileHomeScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.customerContactUsScreen,
    //   page: () => CustomerContactUsScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.storeMapView,
    //   page: () => StoreMapView(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.customerProfileScreen,
    //   page: () => CustomerProfileScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.lifeNeedsHomeScreen,
    //   page: () => LifeNeedsHomeScreen(),
    //   bindings: [CustomerLifeNeedsBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.lifeNeedsProfileScreen,
    //   page: () => LifeNeedsProfileScreen(),
    //   bindings: [CustomerLifeNeedsBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.lifeNeedsCommentScreen,
    //   page: () => LifeNeedsCommentScreen(),
    //   bindings: [CustomerLifeNeedsBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.lifeNeedsUserPostScreen,
    //   page: () => LifeNeedsUserPostScreen(),
    //   bindings: [CustomerLifeNeedsBinding()],
    // ),
    GetPage(
      name: AppRoutes.lifeNeedsChatListScreen,
      page: () => LifeNeedsChatListScreen(),
      bindings: [ChatBinding()],
    ),
    // GetPage(
    //   name: AppRoutes.lifeNeedsCreatePostScreen,
    //   page: () => LifeNeedsCreatePostScreen(),
    //   bindings: [CustomerLifeNeedsBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.myPostsScreen,
    //   page: () => MyPostsScreen(),
    //   bindings: [CustomerLifeNeedsBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.postDetailScreen,
    //   page: () => PostDetailScreen(),
    //   bindings: [CustomerLifeNeedsBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.videoTutoringHomeScreen,
    //   page: () => VideoTutoringHomeScreen(),
    //   bindings: [VideoTutoringBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.videoTutoringMyCourseDetailScreen,
    //   page: () => VideoTutoringMyCourseDetailScreen(),
    //   bindings: [VideoTutoringBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.videoTutoringMyCoursesScreen,
    //   page: () => VideoTutoringMyCoursesScreen(),
    //   bindings: [VideoTutoringBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.videoTutoringChooseYourCoursesScreen,
    //   page: () => VideoTutoringChooseYourCoursesScreen(),
    //   bindings: [VideoTutoringBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.videoTutoringCourseDetailsScreen,
    //   page: () => VideoTutoringCourseDetailsScreen(),
    //   bindings: [VideoTutoringBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.couponsListScreen,
    //   page: () => CouponsListScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.couponsDetailScreen,
    //   page: () => CouponDetailScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.couponsListScreen,
    //   page: () => CouponsListScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.couponsListScreen,
    //   page: () => CouponsListScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.mainCourseScreen,
    //   page: () => MainCourseScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.mainCourseDetailScreen,
    //   page: () => MainCourseDetailScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.legRunningOrderDetailsScreen,
    //   page: () => LegRunningOrderDetailsScreen(),
    //   bindings: [LegRunningBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.cateringCartScreen,
    //   page: () => CloudFamCartScreen(),
    //   bindings: [CloudFamilyBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.cloudFamOrderConfirmationScreen,
    //   page: () => CloudFamOrderConfirmScreen(),
    //   bindings: [CloudFamilyBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.addItemScreen,
    //   page: () => CloudFamAddExtraItemScreen(),
    //   bindings: [CloudFamilyBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.categoriesScreen,
    //   page: () => AllCategoriesScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.popularDishesScreen,
    //   page: () => PopularDishesScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.customerOffersScreen,
    //   page: () => CustomerOffersScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.orderRecommendationsScreen,
    //   page: () => OrderRecommendationsScreen(),
    //   bindings: [CustomerHomeBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.mapViewScreen,
    //   page: () => MapViewScreen(),
    //   bindings: [MapViewBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.paymentSuccessfulRoute,
    //   page: () => PaymentSuccessfulScreen(),
    //   bindings: [PaymentBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.orderDeliveredRoute,
    //   page: () => OrderDeliveredScreen(),
    //   bindings: [SuccessfulOrderBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.promoCodesScreen,
    //   page: () => PromoCodesScreen(),
    //   bindings: [PromoCodeBinding()],
    // ),
    GetPage(
      name: AppRoutes.customerProfileSetup,
      page: () => CustomerProfileSetupScreen(),
      bindings: [CustomerProfileBinding()],
    ),
    // GetPage(
    //   name: AppRoutes.customerWalletScreen,
    //   page: () => WalletScreen(),
    //   bindings: [WalletBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.customerAddMoney,
    //   page: () => AddMoneyScreen(),
    //   bindings: [WalletBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.customerLoyaltyScreen,
    //   page: () => LoyaltyPointsScreen(),
    //   bindings: [LoyaltyBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.customertopUpScreen,
    //   page: () => TopUpSuccessScreen(),
    //   bindings: [WalletBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.customerorderDeliverScreen,
    //   page: () => OrderDeliveredScreen(),
    //   bindings: [WalletBindings()],
    // ),
    GetPage(
      name: AppRoutes.customerLanguageScreen,
      page: () => LanguageScreen(),
      bindings: [LanguageBindings()],
    ),
    // GetPage(
    //   name: AppRoutes.customerOrderScreenRoute,
    //   page: () => CustomerOrderScreens(),
    //   bindings: [AdressBinding()],
    // ),
    // GetPage(
    //   name: AppRoutes.trackOrderDetailScreen,
    //   page: () => TrackOrderDetailScreen(),
    //   bindings: [TrackOrderBindings()],
    // ),
    // GetPage(
    //   name: AppRoutes.trackOrderScreen,
    //   page: () => TrackOrderScreen(),
    //   bindings: [TrackOrderBindings()],
    // ),
    GetPage(
      name: AppRoutes.aboutUsMobileView,
      page: () => AboutUsScreen(),
      bindings: [AboutUsBindings()],
    ),
    GetPage(
      name: AppRoutes.supportChatScreen,
      page: () => SupportChatScreen(),
      bindings: [SupportListBinding()],
    ),
  ];
}
