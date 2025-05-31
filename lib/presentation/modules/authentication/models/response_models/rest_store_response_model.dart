import '../data_model/store_rest_data_model.dart';

class RestStoreResponseModel {
  RestMartStoreModel? restaurantModel;
  String? copyrighths;
  String? message;

  RestStoreResponseModel({this.restaurantModel, this.copyrighths});

  RestStoreResponseModel.fromJson(Map<String, dynamic> json) {
    restaurantModel = json['detail'] != null
        ? new RestMartStoreModel.fromJson(json['detail'])
        : null;
    copyrighths = json['copyrighths'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.restaurantModel != null) {
      data['detail'] = this.restaurantModel!.toJson();
    }
    data['copyrighths'] = this.copyrighths;
    return data;
  }
}
