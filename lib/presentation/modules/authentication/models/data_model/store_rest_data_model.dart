
import 'package:base_project/presentation/modules/authentication/models/data_model/shop_rest_availability_model.dart';

import 'media_file_model.dart';

class RestMartStoreModel {
  dynamic id;
  var title;
  var fee;
  var location;
  var latitude;
  var longitude;
  var description;
  var imageFile;
  var isDefault;
  var isAdvertiseRestaurant;
  var countryCode;
  var contactNumber;
  var averageRating;
  var stateId;
  var typeId; //0 for restaurant
  var createdOn;
  var createdById;
  var isFavourite;
  var perPersonPrice;
  var estimated_delivery_time;
  var estimated_delivery_fees;
  var estimated_delivery_distance;
  List<SetAvailabilityModel>? availability;
  List<MediaFile>? files;

  RestMartStoreModel(
      {this.id,
      this.title,
      this.fee,
      this.location,
      this.latitude,
      this.longitude,
      this.description,
      this.imageFile,
      this.isDefault,
      this.stateId,
      this.typeId,
      this.createdOn,
      this.createdById,
      this.isFavourite,
      this.availability,
      this.files});

  RestMartStoreModel.fromJson(Map<String, dynamic> json, {int? isFav}) {
    id = json['id'];
    title = json['title'];
    fee = json['fee'];
    location = json['location'];

    contactNumber = json['created_by_number'];
    description = json['description'];
    imageFile = json['image_file'];
    isDefault = json['is_default'];
    perPersonPrice = json['price_per_person'];
    estimated_delivery_time = json['estimated_delivery_time'];
    isAdvertiseRestaurant = json['is_promoted'];
    estimated_delivery_distance = json['estimated_delivery_distance'];
    estimated_delivery_fees = json['estimated_delivery_fees'];
    stateId = json['state_id'];
    typeId = json['type_id'];
    latitude = /*(*/ json['latitude'] ??
            "" /* != null && json['latitude'] != '')
        ? double.parse(json['latitude'].toString()).toString()
        : null*/
        ;
    longitude = /*(*/ json['longitude'] ??
        ""; /*!= null && json['longitude'] != '')
        ? double.parse(json['longitude'].toString()).toString()
        : null;*/
    averageRating = _stringToDouble(json['average_rating']);
    isFavourite = isFav ?? json['is_favourite'] ?? 0;
    createdOn = json['created_on'];
    createdById = json['created_by_id'];
    if (json['availability'] != null) {
      availability = <SetAvailabilityModel>[];
      json['availability'].forEach((v) {
        availability!.add(new SetAvailabilityModel.fromJson(v));
      });
    }
    if (json['files'] != null) {
      files = <MediaFile>[];
      json['files'].forEach((v) {
        files!.add(new MediaFile.fromJson(v));
      });
    }
  }

  double? _stringToDouble(var data) {
    return (data != null && data != '') ? double.parse(data.toString()) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['fee'] = this.fee;
    data['location'] = this.location;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['description'] = this.description;
    data['estimated_delivery_time'] = this.estimated_delivery_time;
    data['is_promoted'] = this.isAdvertiseRestaurant;
    data['estimated_delivery_distance'] = this.estimated_delivery_distance;
    data['estimated_delivery_fees'] = this.estimated_delivery_fees;
    data['price_per_person'] = this.perPersonPrice;
    data['image_file'] = this.imageFile;
    data['is_default'] = this.isDefault;
    data['is_favourite'] = this.isFavourite;
    data['state_id'] = this.stateId;
    data['type_id'] = this.typeId;
    data['created_on'] = this.createdOn;
    data['created_by_id'] = this.createdById;
    if (this.availability != null) {
      data['availability'] = this.availability!.map((v) => v.toJson()).toList();
    }
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
