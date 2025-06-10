/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

// live
// const String baseUrl = "https://mars.toxsl.in/food-app-yii2-2152/api";
// const String baseUrl = "http://192.168.2.151:8080/api"; // local yaswant Sir
const String baseUrl = "http://13.200.65.39:3001/api"; // local ansh Sir
// const String baseUrl = "http://192.168.11.153/food-app-yii2-2152/api";

const String signUpEndPoint = "/user/signup";
const String loginEndPoint = "/user/login";

const String forgetPasswordEndPoint = "/user/forgot-password";
const String resendOtpEndPoint = "/user/resend-otp";
const profileSetupEndPoint = "/user/profile-update";
const String addRestaurantEndPoint = "/restaurant/add-restaurant";
const String addMenuItemEndPoint = "/restaurant/add-menu-item";
const String restMenuDetailEndPoint = "/restaurant/item-detail";
const String shopItemDetailEndPoint = "/detail/item-detail";
const String addStoreItemEndPoint = "/detail/add-store-item";
const String userOfferListEndPoint = "/restaurant/offer-list";
const String advertisementListEndPoint = "/promotion/banner-list";
const String addCouponEndPoint = "/offer/add-coupon";
const String couponsListEndPoint = "/offer/coupon-list";
const String couponsDeleteEndPoint = "/offer/delete-coupon";
const String deleteMenuItemEndPoint = "/restaurant/delete-menu-item";
const String deleteShopItemEndPoint = "/detail/delete-menu-item";
const String menuListEndPoint = "/restaurant/menu-list";
const String storeItemsEndPoint = "/detail/my-item-list";
const String changeAvailabilityEndPoint = "/restaurant/availability";
const String changeStockStatusEndPoint = "/restaurant/out-of-stock";
const String restaurantDetailsEndPoint = "/restaurant/restaurant-detail";
const String deleteImageEndPoint = "/restaurant/delete-image";
const String deleteDocsEndPoint = "/user/delete-document";
const String userCheckEndPoint = "/user/check";
const String userLogOutEndPoint = "/user/logout";
const String superMartListEndPoint = "/item-detail/supermart";
const String menuItemDetailEndPoint = "/restaurant/item-detail";
const String addVehicleDetailEndPoint = "/user/add-vehicle-detail";
const String userProfileUpdateEndPoint = "/user/profile-update";
const String changePasswordEndPoint = "/user/change-password";
const String userResetPassword = "/user/set-password";
const String statePageEndPoint = "/user/get-page";
const String faqEndPoint = "/user/faq";
const String userDocsEndPoint = "/user/document-list";
const String userUploadDocEndPoint = "/user/upload-document";
const String cuisineTypesEndPoint = "/restaurant/cuisine-list";
const String menuItemCategoriesEndPoint = "/restaurant/category-list";
const String storeItemCategoriesEndPoint = "/detail/store-category";
const String restaurantListEndPoint = "/restaurant/restaurant-list";
const String nearByRestaurantListEndPoint = "/cart-item/near-by-restaurant";
const String unitsEndPoint = "/product-category/measurements";

const String popularDishesEndPoint = "/cart-item/popular-dish";
const String recommendationsEndPoint = "/state/order-recommendation";
const String searchRestEndPoint = "/state/search-restaurant";
const String notificationToggleEndPoint = "/user/notification-toggle";

const String conatctUsEndPoint = "/user/contact";
const logCrashesExceptionsEndPoint = "/log/exception";

const String addAddressEndPoint = "/address-management/add-address";
const String editAddressEndPoint = "/address-management/add-address";
const String mySavedAddressListEndPoint = "/address-management/address-list";
const String deleteAddressEndPoint = "/address-management/delete-address";
const String setDefaultAddressEndPoint = "/address-management/default-address";
const String getDefaultAddressEndPoint =
    "/address-management/get-default-address";

const String bannerImagesEndPoint = "/item-detail/banner-images";
const String adsImagesEndPoint = "/restaurant/banner";
//life needs
const String postUploadEndPoint = "/post/create-post";
const String postCategoriesEndPoint = "/post/product-category";
const String myPostsEndPoint = "/post/my-post";
const String allPostsEndPoint = "/post/post-list";
const String userPostsEndPoint = "/post/user-post";
const String postDetailEndPoint = "/post/view-detail";
const String userProfileAndPostsEndPoint = "/post/view-post";
const String deletePostEndPoint = "/post/delete-post";
const String addCommentEndPoint = "/post/comment";
const String commentsListEndPoint = "/post/my-comment-list";
const String likeUnlikePostEndPoint = "/post/like-post";

//cloud fam
const String addPlateEndPoint = "/plate/add-plate";
const String addRecentSearchHistory = '/user/add-recent-search';
const String addPlateItemEndPoint = "/plate/add-item";
const String plateItemsListEndPoint = "/plate/item-list";
const String platesListEndPoint = "/plate/plate-list";
const String platesItemDetailEndPoint = "/plate/item-detail";
const String plateDetailEndPoint = "/plate/plate-detail";
const String deletePlateEndPoint = "/plate/delete-plate";
const String deletePlateItemEndPoint = "/plate/delete-item";

const String setDriverCurrentLocEndPoint = "/cart-item/driver-location";
const String showDispatchButtonEndPoint = "/cart-item/dispatch-enable";

//leg running
const String addCourierDetailEndPoint = "/service/service-detail";
const String courierPackInfoEndPoint = "/service/get-detail";
const String serviceListEndPoint = "/service/service-list";
const String makeCourierPaymentEndPoint = "/service/make-payment";
const String myCouriersListEndPoint = "/service/my-orders";

//cart and order(customer)
const String addToCartEndPoint = "/cart/add-to-cart";
const String myCartListEndPoint = "/cart/my-cart-list";
const String cartItemDetailEndPoint = "/cart/item-view";
const String updateCartQuantityEndPoint = "/cart/update-item";
const String reOrderEndPoint = "/cart-item/re-order";
const String deleteCartItemEndPoint = "/cart/delete-cart";
const String cartStatusEndPoint = "/cart/cart-status";

//fav
const String markUnMarkFavEndPoint = "/state/favourite";
const String favouritesListEndPoint = "/state/favourite-list";
const String recentHistoryListEndPoint = "/user/recent-search-list";

//orders
const String upcomingRequestsListEndPoint = "/restaurant/upcomming-order";
const String deliveredOrdersListEndPoint = "/state/delivered-order";
const String restOrdersListEndPoint = "/restaurant/status-list";
const String sendDriversRequestEndPoint = "/state/send-request";

const String driverAcceptRejectReqEndPoint = "/states/request-accept-reject";
const String removeDriverEndPoint = "/state/delete-request";
const String verifyOrderCodeEndPoint = "/state/verify-order";
const String changeDriverStateEndPoint = "/state/update-status";

const String createOrderEndPoint = "/cart-item/place-order";
const String ordersListEndPoint = "/cart-item/order-history";
const String orderDetailEndPoint = "/cart-item/order-detail";
const String changeOrderStateEndPoint = "/state/change-state";
const String cancelRejectOrderEndPoint = "/restaurant/reject-order";
const String updateDriverLocEndPoint = "/cart-item/update-location";
const String dateCheckEndPoint = "/user/date-check";

// video tutoring
const String videoTutCoursesListEndPoint = "/product-category/tutoring-list";
const String myCoursesListEndPoint = "/watch-lesson/my-course";
const String buyCourseEndPoint = "/subscribed-course/buy-course";
const String setCurrentWatchingEndPoint = "/subscribed-course/play-video";
const String markLessonCompleteEndPoint = "/subscribed-course/mark-completed";
const String setWatchDurationEndPoint = "/watch-lesson/lesson-duration";

// Payment
const String cardsListEndPoint = "/user/card-list";
const String addCardEndPoint = "/user/add-card";
const String deleteCardEndPoint = "/user/delete-card";
const String addAccountEndPoint = "/user/create-connect-account";

// Chat
const String loadChatEndPoint = "/chat/load-chat";
const String chatListEndPoint = "/chat/list";
const String deleteEndPoint = "/chat/delete-chat";
const String sendMessageEndPoint = "/chat/send-message";

// Rating
const String ratingsListEndPoint = "/rating/rating-list";
const String driverRatingsListEndPoint = "/rating/driver-list";
const String addRatingsEndPoint = "/rating/add-rating";

const String notificationsListEndPoint = "/user/notification-list";
const String clearAllNotificationsEndPoint = "/user/clear-notification";

/* AddressType */
const addressTypeHome = 1;
const addressTypeOffice = 2;
const addressTypeHotel = 3;
const addressTypeOther = 4;

const String recordIdKey = 'id';

const senderType = 1;
const reciverType = 2;

const deleteAddress = "deleteAddress";
const deleteCoupon = "deleteCoupon";
const defaultAddress = "defaultAddress";

/*Wallet*/
const String myWalletListUrl = "/wallet/my-wallet-list";
const String addMoneyWalletUrl = "/wallet/add-money";
const String loyaltyPointListUrl = "/loyalty-point/list";
const String socialLoginUrl = "/user/social-login";
const String geDriverLocationUrl = "/user/get-location";
const String getRecentSearchesListUrl = "/user/recent-search-list";
const String loadNewMessageApiUrl = "/chat/load-new-message";

const String bestSellingDishesApiUrl = "/restaurant/best-selling-dishes";
const String bestSellingItemsApiUrl = "/restaurant/best-selling-items";
const String totalPriceApiUrl = "/cart/total-price";
const String addHomePageApiUrl = "/restaurant/add-home-page";
const String driverUpdateLocationApiUrl = "/user/update-location";


const String sendOtpEndPoint = "/auth/send-otp";
const String verifyOtpEndPoint = "/auth/verify-otp";
const String homeEndPoint = "/auth/home";
const String addPaymentEndPoint = "/auth/add-payment";
const String joinPoolEndPoint = "/auth/join-pool";
const String poolDetailsPoint = "/auth/pools";
const String walletDetailsPoint = "/auth/wallet";
const String saveUserPredictionEndPoint = "/auth/save-prediction";
const String userTransactionEndPoint = "/auth/user-transactions";
const String allPredictionEndPoint = "/auth/get-user-all-predictions";
const String getUsersMatchPredictionEndPoint = "/auth/get-user-match-predictions";



