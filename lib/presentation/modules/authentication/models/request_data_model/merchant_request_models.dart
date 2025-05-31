import 'package:base_project/app/export.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data_model/media_file_model.dart';
import '../data_model/shop_rest_availability_model.dart';

class MerchantRequestModel {
  static resUploadModel(
      {required String? title,
      required String? deliveryFee,
      required LatLng? latLng,
      required String? address,
      required String? description,
      required String? perPersonPrice,
      required String? estimatedDeliveryTime,
      required MediaFile? resImage,
      required int? subType,
      List<MediaFile> imageVideoList = const [],
      List<SetAvailabilityModel> availabilityList = const []}) async {
    List<MultipartFile> multipartImageVideoList = [];
    for (var i = 0; i < imageVideoList.length; i++) {
      // final multipartFile = await getMultipartFromMediaFile(imageVideoList[i]);
      // if (multipartFile != null) {
      //   multipartImageVideoList.add(multipartFile);
      // }
    }

    final Map<String, dynamic> data = <String, dynamic>{};
    data["Detail[title]"] = title;
    data["Detail[fee]"] = deliveryFee != '' ? deliveryFee : '0';
    data["Detail[description]"] = description ?? '';
    data["Detail[location]"] = address ?? '';
    if (subType != null) {
      // marijuana stores and fresh food malls in case of store
      // food restaurant and cloud fam in case of restaurant
      data["Detail[type_id]"] = subType;
    }

    data["Detail[latitude]"] = latLng?.latitude;
    data["Detail[longitude]"] = latLng?.longitude;
    data["Detail[price_per_person]"] = perPersonPrice;
    data["Detail[estimated_delivery_time]"] = estimatedDeliveryTime;
    data["Detail[detail]"] = jsonEncode(availabilityList);
    if (resImage != null) {
      // final imageMultipart = await getMultipartFromMediaFile(resImage);
      // if (imageMultipart != null) {
      //   data["Detail[image_file]"] = imageMultipart;
      // }
    }
    multipartImageVideoList.asMap().forEach((index, value) {
      data["File[key][$index]"] = value;
    });
    return data;
  }

  static menuUploadModel({
    required String? title,
    required int? cuisineType,
    required int? itemType,
    required int? restaurantId,
    required int? categoryId,
    required int? isAvailable,
    required String? cookTime,
    required String? startTime,
    required String? endTime,
    required String? description,
    String? perPlatePrice, //for cloud fam
    List<MediaFile> imageVideoList = const [],
    // List<AddOnItemModel> addOnItems = const [],
    // List<RestMenuPriceModel> pricesList = const [],
  }) async {
    List<MultipartFile> multipartImageVideoList = [];
    for (var i = 0; i < imageVideoList.length; i++) {
      // final multipartFile = await getMultipartFromMediaFile(imageVideoList[i]);
      // if (multipartFile != null) {
      //   multipartImageVideoList.add(multipartFile);
      // }
    }

    final Map<String, dynamic> data = <String, dynamic>{};
    data["Item[title]"] = title;
    data["Item[cuisine_type]"] = cuisineType ?? '';
    data["Item[item_type]"] = itemType ?? '';
    data["Item[restaurant_id]"] = restaurantId ?? '';
    data["Item[category_id]"] = categoryId ?? '';
    data["Item[cook_time]"] = cookTime ?? '';
    data["Item[start_time]"] = startTime ?? '';
    data["Item[end_time]"] = endTime ?? '';
    data["Item[description]"] = description ?? '';
    data["Item[customized_price]"] = perPlatePrice ?? '';
    data["Item[is_available]"] = isAvailable ?? 1;
    // if (addOnItems.isNotEmpty) {
    //   data["Item[detail]"] = jsonEncode(addOnItems);
    // }
    // if (pricesList.isNotEmpty) {
    //   data["Item[item_price]"] = jsonEncode(pricesList);
    // }
    multipartImageVideoList.asMap().forEach((index, value) {
      data["File[key][$index]"] = value;
    });
    return data;
  }

  static storeItemUploadModel({
    required String? title,
    required int? storeId,
    required int? categoryId,
    required int? isAvailable,
    required String? description,
    List<MediaFile> imageVideoList = const [],
    // List<ShopMartPriceModel> pricesList = const [],
  }) async {
    List<MultipartFile> multipartImageVideoList = [];
    for (var i = 0; i < imageVideoList.length; i++) {
      // final multipartFile = await getMultipartFromMediaFile(imageVideoList[i]);
      // if (multipartFile != null) {
      //   multipartImageVideoList.add(multipartFile);
      // }
    }

    final Map<String, dynamic> data = <String, dynamic>{};
    data["Detail[title]"] = title;
    if (categoryId != null) {
      data["Detail[category_id]"] = categoryId ?? '';
    }
    data["Detail[description]"] = description ?? '';
    data["Detail[is_available]"] = isAvailable ?? 1;
    data["Detail[store_id]"] = storeId ?? '';
    // if (pricesList.isNotEmpty) {
    //   data["Detail[detail]"] = jsonEncode(pricesList);
    // }
    multipartImageVideoList.asMap().forEach((index, value) {
      data["File[key][$index]"] = value;
    });
    return data;
  }

  static addPlateReqModel({
    required String? title,
    required int? cuisineType,
    required int? restaurantId,
    required String? description,
    required String? platePrice,
    required String? addedItemsList,
    List<MediaFile> imageVideoList = const [],
  }) async {
    List<MultipartFile> multipartImageVideoList = [];
    for (var i = 0; i < imageVideoList.length; i++) {
      // final multipartFile = await getMultipartFromMediaFile(imageVideoList[i]);
      // if (multipartFile != null) {
      //   multipartImageVideoList.add(multipartFile);
      // }
    }

    final Map<String, dynamic> data = <String, dynamic>{};
    data["Plate[title]"] = title;
    data["Plate[cusine_type]"] = cuisineType ?? '';
    data["Plate[restaurant_id]"] = restaurantId ?? '';
    data["Plate[description]"] = description ?? '';
    data["Plate[price]"] = platePrice ?? '';
    data["Plate[detail]"] = addedItemsList ?? '';
    multipartImageVideoList.asMap().forEach((index, value) {
      data["File[key][$index]"] = value;
    });
    return data;
  }

  static cloudFamItemUploadModel({
    required String? title,
    required int? cuisineType,
    required int? isAvailable,
    required int? itemType,
    required String? cookTime,
    required int? restaurantId,
    required String? description,
    required String? itemPrice,
    List<MediaFile> imageVideoList = const [],
  }) async {
    List<MultipartFile> multipartImageVideoList = [];
    for (var i = 0; i < imageVideoList.length; i++) {
      // final multipartFile = await getMultipartFromMediaFile(imageVideoList[i]);
      // if (multipartFile != null) {
      //   multipartImageVideoList.add(multipartFile);
      // }
    }

    final Map<String, dynamic> data = <String, dynamic>{};
    data["Item[title]"] = title;
    data["Item[cusine_type]"] = cuisineType ?? '';
    data["Item[restaurant_id]"] = restaurantId ?? '';
    data["Item[description]"] = description ?? '';
    data["Item[price]"] = itemPrice ?? '';
    data["Item[item_type]"] = itemType ?? '';
    data["Item[cook_time]"] = cookTime ?? '';
    data["Item[is_available]"] = isAvailable ?? 0;
    multipartImageVideoList.asMap().forEach((index, value) {
      data["File[key][$index]"] = value;
    });
    return data;
  }

  static couponUploadModel({
    required String? title,
    required int? typeId,
    required int? restStoreId,
    required String? discount,
    required String? minAmount,
    required String? description,
    required String? expiryDate,
  }) async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Offer[title]"] = title ?? '';
    data["Offer[type_id]"] = typeId ?? 0;
    data["Offer[restaurant_id]"] = restStoreId ?? 0;
    data["Offer[minimum_amount]"] = minAmount ?? '';
    data["Offer[end_time]"] = expiryDate ?? '';
    data["Offer[discount]"] = discount ?? '';
    data["Offer[description]"] = description ?? '';
    return data;
  }
}
