import 'package:base_project/app/modules/authentication/models/data_model/store_rest_data_model.dart';
import 'package:base_project/app/modules/authentication/models/data_model/vehicle_data_model.dart';
// import 'package:base_project/app/modules/customer/customer_life_needs/models/data_models/post_model.dart';

// import '../../../customer/home/model/data_model/address_module/address_data_model.dart';
import 'media_file_model.dart';

class UserDataModel {
  int? id;
  String? firstName;
  String? fullName;
  String? lastName;
  String? email;
  String? dateOfBirth;
  var gender;
  var countryCode;
  String? contactNo;
  String? merchantId;
  String? profileFile;
  dynamic is_profile_setup;
  dynamic isSocial;
  var isNotify;
  var language;
  var tos;
  int? otp;
  int? otpVerify;
  int? isDefault;
  int? isAdded;
  var roleId;
  int? stateId;
  var businessType; //whether store or Restaurant
  var businessSubType; // marijuana stores and fresh food malls in case of store, food restaurant and cloud fam in case of restaurant
  var timezone;
  String? createdOn;
  var restaurantId;
  var averageRating; //for driver
  var stripeUrl;
  var bankAccountId;
  var driverTripsCount;
  var driverLat;
  var driverLng;
  var driverAddress;
  String? licenceFile;
  List<MediaFile>? documentsList;
  VehicleData? vehicleData;
  RestMartStoreModel? restaurantData;
  // List<PostModel>? viewPosts;
  // AddressDataModel? customerAddressModel;
  // AddressDataModel? driverCurrentAddress;
  String? lastMessage;
  int? lastMessageId;
  var unreadMessageCount;
  var lastMessageTime;

  UserDataModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.fullName,
      this.email,
      this.dateOfBirth,
      this.merchantId,
      this.is_profile_setup,
      this.isSocial,
      this.gender,
      this.countryCode,
      this.contactNo,
      this.profileFile,
      this.language,
      this.tos,
      this.otp,
      this.otpVerify,
      this.isDefault,
      this.isAdded,
      this.roleId,
      this.stateId,
      this.businessType,
      this.timezone,
      this.createdOn,
      this.restaurantId,
      this.licenceFile,
      this.documentsList,
      this.vehicleData,
      this.restaurantData,
      // this.viewPosts,
      // this.customerAddressModel,
      this.lastMessage,
      this.lastMessageId,
      this.lastMessageTime,
      this.isNotify,
      // this.driverCurrentAddress,
      this.businessSubType,
      this.driverAddress,
      this.driverLng,
      this.driverLat,
      this.driverTripsCount,
      this.bankAccountId,
      this.stripeUrl,
      this.averageRating,
      this.unreadMessageCount});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    is_profile_setup = json['is_profile_setup'];
    isSocial = json['is_social'];
    merchantId = json['merchant_id'];
    isNotify = json['is_notify'];
    email = json['email'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    countryCode = json['country_code'];
    contactNo = json['contact_no'];
    profileFile = json['profile_file'];
    averageRating = _stringToDouble(json['average_rating']);
    language = json['language'];
    tos = json['tos'];
    driverTripsCount = json['total_trips'];
    otp = json['otp'];
    otpVerify = json['otp_verify'];
    isDefault = json['is_default'];
    isAdded = json['is_added'];
    roleId = json['role_id'];
    stateId = json['state_id'];
    businessType = json['type_id'];
    businessSubType = json['type_id'];
    timezone = json['timezone'];
    stripeUrl = json['stripe_url'];
    bankAccountId = json['bank_account_id'];
    createdOn = json['created_on'];
    restaurantId = json['restrurant_id'];
    licenceFile = json['license_file'] ?? '';
    driverLat = json['latitude'] ?? '';
    driverLng = json['longitude'] ?? '';
    driverAddress = json['address'] ?? '';
    if (json['document_file'] != null) {
      documentsList = <MediaFile>[];
      json['document_file'].forEach((v) {
        documentsList!.add(new MediaFile.fromJson(v));
      });
    }
    // if (json['viewPost'] != null) {
    //   viewPosts = <PostModel>[];
    //   json['viewPost'].forEach((v) {
    //     viewPosts!.add(new PostModel.fromJson(v, getThumbnail: true));
    //   });
    // }
    if (json['vehicle'] != null) {
      vehicleData = VehicleData.fromJson(json['vehicle']);
    }
    if (json['restaurant'] != null) {
      restaurantData = RestMartStoreModel.fromJson(json['restaurant']);
    }
    // if (json['customer_address'] != null) {
    //   customerAddressModel =
    //       AddressDataModel.fromJson(json['customer_address']);
    // }
    // if (json['driver_current_address'] != null) {
    //   customerAddressModel =
    //       AddressDataModel.fromJson(json['driver_current_address']);
    // }
    lastMessage = json['last_message'];
    lastMessageId = json['last_message_id'];
    lastMessageTime = json['last_message_time'];
    unreadMessageCount = json['unread_notification_count'];
  }

  double? _stringToDouble(var data) {
    return (data != null && data != '') ? double.parse(data.toString()) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['merchant_id'] = this.merchantId;
    data['last_name'] = this.lastName;
    data['is_profile_setup'] = this.is_profile_setup;
    data['is_social'] = this.isSocial;
    data['full_name'] = this.fullName;
    data['is_notify'] = this.isNotify;
    data['email'] = this.email;
    data['latitude'] = this.driverLat;
    data['longitude'] = this.driverLng;
    data['address'] = this.driverAddress;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['country_code'] = this.countryCode;
    data['contact_no'] = this.contactNo;
    data['profile_file'] = this.profileFile;
    data['language'] = this.language;
    data['tos'] = this.tos;
    data['otp'] = this.otp;
    data['otp_verify'] = this.otpVerify;
    data['is_default'] = this.isDefault;
    data['is_added'] = this.isAdded;
    data['role_id'] = this.roleId;
    data['state_id'] = this.stateId;
    data['type_id'] = this.businessType;
    data['type_id'] = this.businessSubType;
    data['timezone'] = this.timezone;
    data['created_on'] = this.createdOn;
    data['stripe_url'] = this.stripeUrl;
    data['bank_account_id'] = this.bankAccountId;
    data['restrurant_id'] = this.restaurantId;
    data['license_file'] = this.licenceFile;
    if (this.documentsList != null) {
      data['document_file'] =
          this.documentsList!.map((v) => v.toJson()).toList();
    }
    // if (this.viewPosts != null) {
    //   data['viewPosts'] = this.viewPosts!.map((v) => v.toJson()).toList();
    // }
    if (vehicleData != null) {
      data['vehicle'] = vehicleData?.toJson();
    }
    if (restaurantData != null) {
      data['restaurant'] = restaurantData?.toJson();
    }
    // if (customerAddressModel != null) {
    //   data['customer_address'] = customerAddressModel?.toJson();
    // }
    // if (driverCurrentAddress != null) {
    //   data['driver_current_address'] = driverCurrentAddress?.toJson();
    // }
    data['last_message'] = this.lastMessage;
    data['last_message_id'] = this.lastMessageId;
    data['last_message_time'] = this.lastMessageTime;
    data['unread_notification_count'] = this.unreadMessageCount;
    return data;
  }

  // CopyWith method

  UserDataModel copyWith({
    int? id,
    String? firstName,
    String? fullName,
    String? lastName,
    String? email,
    String? dateOfBirth,
    var gender,
    var countryCode,
    String? contactNo,
    String? merchantId,
    String? profileFile,
    dynamic is_profile_setup,
    dynamic isSocial,
    var isNotify,
    var language,
    var tos,
    int? otp,
    int? otpVerify,
    int? isDefault,
    int? isAdded,
    var roleId,
    int? stateId,
    var businessType,
    var businessSubType,
    var timezone,
    String? createdOn,
    var restaurantId,
    var averageRating,
    var stripeUrl,
    var bankAccountId,
    var driverTripsCount,
    var driverLat,
    var driverLng,
    var driverAddress,
    String? licenceFile,
    List<MediaFile>? documentsList,
    VehicleData? vehicleData,
    RestMartStoreModel? restaurantData,
    // List<PostModel>? viewPosts,
    // AddressDataModel? customerAddressModel,
    // AddressDataModel? driverCurrentAddress,
    String? lastMessage,
    int? lastMessageId,
    var unreadMessageCount,
    var lastMessageTime,
  }) {
    return UserDataModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      fullName: fullName ?? this.fullName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      countryCode: countryCode ?? this.countryCode,
      contactNo: contactNo ?? this.contactNo,
      merchantId: merchantId ?? this.merchantId,
      profileFile: profileFile ?? this.profileFile,
      is_profile_setup: is_profile_setup ?? this.is_profile_setup,
      isSocial: isSocial ?? this.isSocial,
      isNotify: isNotify ?? this.isNotify,
      language: language ?? this.language,
      tos: tos ?? this.tos,
      otp: otp ?? this.otp,
      otpVerify: otpVerify ?? this.otpVerify,
      isDefault: isDefault ?? this.isDefault,
      isAdded: isAdded ?? this.isAdded,
      roleId: roleId ?? this.roleId,
      stateId: stateId ?? this.stateId,
      businessType: businessType ?? this.businessType,
      businessSubType: businessSubType ?? this.businessSubType,
      timezone: timezone ?? this.timezone,
      createdOn: createdOn ?? this.createdOn,
      restaurantId: restaurantId ?? this.restaurantId,
      averageRating: averageRating ?? this.averageRating,
      stripeUrl: stripeUrl ?? this.stripeUrl,
      bankAccountId: bankAccountId ?? this.bankAccountId,
      driverTripsCount: driverTripsCount ?? this.driverTripsCount,
      driverLat: driverLat ?? this.driverLat,
      driverLng: driverLng ?? this.driverLng,
      driverAddress: driverAddress ?? this.driverAddress,
      licenceFile: licenceFile ?? this.licenceFile,
      documentsList: documentsList ?? this.documentsList,
      vehicleData: vehicleData ?? this.vehicleData,
      restaurantData: restaurantData ?? this.restaurantData,
      // viewPosts: viewPosts ?? this.viewPosts,
      // customerAddressModel: customerAddressModel ?? this.customerAddressModel,
      // driverCurrentAddress: driverCurrentAddress ?? this.driverCurrentAddress,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageId: lastMessageId ?? this.lastMessageId,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      unreadMessageCount: unreadMessageCount ?? this.unreadMessageCount,
    );
  }
}
