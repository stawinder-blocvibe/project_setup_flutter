import '../data_model/vehicle_data_model.dart';

class VehicleResponseModel {
  VehicleData? detail;
  String? message;
  String? copyrighths;

  VehicleResponseModel({this.detail, this.message, this.copyrighths});

  VehicleResponseModel.fromJson(Map<String, dynamic> json) {
    detail = json['detail'] != null
        ? new VehicleData.fromJson(json['detail'])
        : null;
    message = json['message'];
    copyrighths = json['copyrighths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    data['message'] = this.message;
    data['copyrighths'] = this.copyrighths;
    return data;
  }
}
