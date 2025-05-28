/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

int roleCustomer = 2;
int roleRestaurant = 4;
int roleDriver = 3;
// for differentiating bw roles of driver customer/ merchant

/// store_types
const businessTypeRestaurant = 3;
const businessTypeShop = 1;
const businessTypeSuperMart = 2;
//for differentiating between merchant cat

//merchant/business sub types
const constFoodMalls = 1;
const constMarijuanaStores = 2;
const constAllSuperMarkets = 3;

//rest sub types
const constFoodRestaurant = 4;
const constCloudFamilyRest = 5;

const male = 1;
const female = 2;
const others = 3;

const String googleApiKey = 'AIzaSyDsWTGVDQCcizCkhVmHMp5_x5UzRpSdHxc';

const idMaxLength = 10;
const licencePlateMaxLength = 10;

const int typeImageConst = 1;
const int typeVideoConst = 2;
const int typePdfConst = 3;

const int maxPicturesCountConst = 5;
const int maxDocsCountConst = 5;
const String yuanCurrencySymbolCode = '\$';

const pageTypePrivacyPolicy = 0;
const pageTypeTerms = 1;
const pageTypeAboutUs = 2;
const pageTypeHelp = 3;

const orderDetailTimerDuration = 10; // seconds

const couponTypeAmount = 0;
const couponTypePercent = 1;
bool isFromLogin = false;

const idKey = "id";
const latKey = "lat";
const lngKey = "long";
const quantityKey = "quantity";
const storeTypeKey = "store_type";
const itemKey = "item";
const pageKey = "page";
const searchKey = "search";
const categoryIdKey = "category_id";
const restaurantIdKey = "restaurant_id";
const stateIdKey = "state_id";
const stateKey = "state";
const addressIdKey = "address_id";
const orderIdKey = "order_id";
const orderNoKey = "order_no";
const shipmentKey = "shipment";
const cardIdKey = "card_id";
const urlKey = "url";
const orderTypeKey = "order_type";
const rotationKey = "rotation";
const restIdKey = "rest_id";
const accessTokenKey = "access-token";
const typeKey = "type";
const selectedRoleKey = "selectedRoleKey";
const fromForgetPasswordKey = "fromForgetPasswordKey";
const couponKey = "couponKey";
const phoneKey = "phone";
const emailKey = "email";
const navigationBoolKey = "navigationBoolKey";
const navigationBoolKey2 = "navigationBoolKey2";
const countryDialCodeekey = "countryDialCodeekey";
const String frontendDateFormatConst = 'yyyy-MM-dd';

const SUNDAY = 0;
const MONDAY = 1;
const TUESDAY = 2;
const WEDNESDAY = 3;
const THURSDAY = 4;
const FRIDAY = 5;
const SATURDAY = 6;

const foodOrderSimpleOrder = 0;
const foodOrderTypeCatering = 1;

const paymentTypeCOD = 1;
const paymentTypeCard = 2;
const paymentTypeWallet = 3;

const paymentStatusPaid = 1;
const paymentStatusUnPaid = 0;

const orderStatePlaced = 1;
const orderStatePreparing = 2;
const orderStateReadyToPickUp = 3;
const orderStatePickedUp = 4;
const orderStateDelivered = 5;
const orderStateAccepted = 13; //added later
const orderStateCancelled = 6;
const orderStateRejected = 7;
const orderStateUpcoming = 0;
const orderStateAllOrders = 0;

// fav consts
const constFavRestaurants = 1;
const constFavRestItems = 2;
const constFavStoresItems = 3;
const constFavStores = 4;
const constFavCloudFamily = 5;

// driver states

const driverStateAcceptedRequest = 8;
const driverStateReachedPickUp = 9;

const driverStateArrivingDropOff = 10;
const driverStateReachedDropOff = 11;
const driverStateNotAssigned = 12;

// order types
const orderTypeFood = 0; //order from rest/store
const orderTypeCourier = 1; // leg running order

const double initialMapZoomLevel = 18;
const double animateMapZoomLevel = 15;

// notifications types
const constNotifyNewOrder = '1';
const constNotifyOrderPlaced = '0';

const constNotifyOrderConfirmed = '2';
const constNotifyOrderRejected = '3';
const constNotifyOrderDelivered = '4';
const constNotifyOrderPickedUp = '5';

const constNotifyRestOrderDelivered = '16'; // to rest

const constNotifyNewDeliveryRequest = '6'; //to driver
const constNotifyNewDriverAccepted = '7'; //to rest
const constNotifyDriverRemoved = '8'; //to driver
const constNotifyReadyToDispatch = 9; //to rest

const constNotifyCourierRequest = '10'; //to driver
const constNotifyCourierPickup = '11'; //to customer
const constNotifyCourierDeliver = '12'; //to customer

const constNotifySendMessage = '13';
const constNotifyPostLike = '14';
const constNotifyPostComment = '15';
const constNotifyOrderReady = '17';
const constNotifyChat = '20';
const constNotifyChatSupport = '21';
const constNotifyRatingReceived = 18;

const typeOutOfStock = 0;
const typeInStock = 1;

const TYPE_HORIZONTAL = 1;
const TYPE_VERTICAL = 2;

const SORT_BY_LOW_TO_HIGH = 1;
const SORT_BY_HIGH_TO_LOW = 2;
const SORT_BY_PREVIOUS_ORDER = 3;

const customerIdKey = 'customerIdKey';
const driverIdKey = 'driverIdKey';
const restaurantIdKeyNew = 'restaurantIdKeyNew';
const isDriverKey = 'isDriverKey';

/*data--->userToken->24T_rEeKmwIW5EK2eJp_MFt--smGvgdA>>true>>
{type_id: 0, model_type: app\modules\order\models\State, description: , model_id: 713,
 title: Order Placed successfully, is_read: 0, full_name: Administrator,
 created_on: 2025-02-18 12:55:34, to_user_id: 207,
  image_file: https://mars.toxsl.in/food-app-yii2-2152/user/image/1?file=user-1729581043-profile_file-user_id_1.jpeg, id: 2488,
   state_id: 0, created_by_id: 1}
*/

const TYPE_CASH_ON_DELIVERY = 1;
const TYPE_CARD_PAYMENT = 2;
const TYPE_WALLET_PAYMENT = 3;
