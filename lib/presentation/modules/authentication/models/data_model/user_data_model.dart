
 import 'package:base_project/presentation/modules/authentication/models/data_model/store_rest_data_model.dart';
import 'package:base_project/presentation/modules/authentication/models/data_model/vehicle_data_model.dart';

import 'media_file_model.dart';

 class UserDataModel {
   UserDataModel({
     this.id,
     this.mobileNumber,
     this.fullName,
     this.email,
     this.dob,
     this.isGenius,
     this.isPaidUser,
     this.geniusPaidAt,
     this.paymentStatus,
     this.otp,
     this.otpExpiry,
     this.createdAt,
     this.updatedAt,});

   UserDataModel.fromJson(dynamic json) {
     id = json['id'];
     mobileNumber = json['mobileNumber'];
     fullName = json['fullName'];
     email = json['email'];
     dob = json['dob'];
     isGenius = json['isGenius'];
     isPaidUser = json['isPaidUser'];
     geniusPaidAt = json['geniusPaidAt'];
     paymentStatus = json['paymentStatus'];
     otp = json['otp'];
     otpExpiry = json['otpExpiry'];
     createdAt = json['createdAt'];
     updatedAt = json['updatedAt'];
   }
   String? id;
   String? mobileNumber;
   dynamic fullName;
   dynamic email;
   dynamic dob;
   bool? isGenius;
   bool? isPaidUser;
   dynamic geniusPaidAt;
   dynamic paymentStatus;
   dynamic otp;
   dynamic otpExpiry;
   String? createdAt;
   String? updatedAt;
   UserDataModel copyWith({  String? id,
     String? mobileNumber,
     dynamic fullName,
     dynamic email,
     dynamic dob,
     bool? isGenius,
     bool? isPaidUser,
     dynamic geniusPaidAt,
     dynamic paymentStatus,
     dynamic otp,
     dynamic otpExpiry,
     String? createdAt,
     String? updatedAt,
   }) => UserDataModel(  id: id ?? this.id,
     mobileNumber: mobileNumber ?? this.mobileNumber,
     fullName: fullName ?? this.fullName,
     email: email ?? this.email,
     dob: dob ?? this.dob,
     isGenius: isGenius ?? this.isGenius,
     isPaidUser: isPaidUser ?? this.isPaidUser,
     geniusPaidAt: geniusPaidAt ?? this.geniusPaidAt,
     paymentStatus: paymentStatus ?? this.paymentStatus,
     otp: otp ?? this.otp,
     otpExpiry: otpExpiry ?? this.otpExpiry,
     createdAt: createdAt ?? this.createdAt,
     updatedAt: updatedAt ?? this.updatedAt,
   );
   Map<String, dynamic> toJson() {
     final map = <String, dynamic>{};
     map['id'] = id;
     map['mobileNumber'] = mobileNumber;
     map['fullName'] = fullName;
     map['email'] = email;
     map['dob'] = dob;
     map['isGenius'] = isGenius;
     map['isPaidUser'] = isPaidUser;
     map['geniusPaidAt'] = geniusPaidAt;
     map['paymentStatus'] = paymentStatus;
     map['otp'] = otp;
     map['otpExpiry'] = otpExpiry;
     map['createdAt'] = createdAt;
     map['updatedAt'] = updatedAt;
     return map;
   }

 }

