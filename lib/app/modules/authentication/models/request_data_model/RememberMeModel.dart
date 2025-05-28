import 'package:intl_phone_field/countries.dart';

class RememberMeModel {
  int? roleId;
  String? phoneNumber;
  String? riderMerchantId;
  String? password;

  String? name;
  String? flag;
  String? code;
  String? dialCode;
  int? minLength;
  int? maxLength;

  RememberMeModel({
    this.phoneNumber,
    this.password,
    this.riderMerchantId,
    this.roleId,
    this.name,
    this.flag,
    this.code,
    this.dialCode,
    this.minLength,
    this.maxLength,
  });

  RememberMeModel.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    phoneNumber = json['phoneNumber'];
    /* countryCode = json['countryCode'] != null
        ? new CountryDataModel.fromJson(json['countryCode'])
        : null;*/
    riderMerchantId = json['riderId'];
    password = json['password'];
    name = json['name'];
    flag = json['flag'];
    code = json['code'];
    dialCode = json['dialCode'];
    minLength = json['minLength'];
    maxLength = json['maxLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roleId'] = roleId;
    data['phoneNumber'] = phoneNumber;
    /* if (this.countryCode != null) {
      data['countryCode'] = this.countryCode!.toJson();
    }
*/
    data['riderId'] = riderMerchantId;
    data['password'] = password;

    data['name'] = name;
    data['flag'] = flag;
    data['code'] = code;
    data['dialCode'] = dialCode;
    data['minLength'] = minLength;
    data['maxLength'] = maxLength;
    return data;
  }
}

class CountryDataModel {
  String? name;
  String? flag;
  String? code;
  String? dialCode;
  int? minLength;
  int? maxLength;

  CountryDataModel({
    this.name,
    this.flag,
    this.code,
    this.dialCode,
    this.minLength,
    this.maxLength,
  });

  CountryDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    flag = json['flag'];
    code = json['code'];
    dialCode = json['dialCode'];
    minLength = json['minLength'];
    maxLength = json['maxLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['flag'] = flag;
    data['code'] = code;
    data['dialCode'] = dialCode;
    data['minLength'] = minLength;
    data['maxLength'] = maxLength;
    return data;
  }

  Map<String, dynamic> toJsonCountry(Country country) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = country.name;
    data['flag'] = country.flag;
    data['code'] = country.code;
    data['dialCode'] = country.dialCode;
    data['minLength'] = country.minLength;
    data['maxLength'] = country.maxLength;
    return data;
  }
}
