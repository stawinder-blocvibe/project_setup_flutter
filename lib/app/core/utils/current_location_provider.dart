import 'package:base_project/app/export.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as Location;

bool _isGettingLocation = false;

/*Future<Location.LocationData?> determineCurrentLatLong(
    {bool showLoader = false}) async
{
  if (_isGettingLocation == false) {
    // to disable multiple requests
    // _isGettingLocation=true;
    if (showLoader) {
      customLoader.show(Get.overlayContext);
    }
    Location.Location location = Location.Location();

    bool _serviceEnabled;
    Location.PermissionStatus _permissionGranted;
    Location.LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _isGettingLocation = false;
      customLoader.hide();
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == Location.PermissionStatus.denied) {
      customLoader.hide();
      _isGettingLocation = false;
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != Location.PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    _isGettingLocation = false;
    customLoader.hide();
    return _locationData;
  }
}*/

Future<Location.LocationData?> determineCurrentLatLong({
  bool showLoader = false,
}) async {
  // Prevent multiple requests by checking _isGettingLocation status
  if (_isGettingLocation) {
    return null; // Exit early if a request is already in progress
  }

  _isGettingLocation = true;

  // Show loader if needed
  if (showLoader) {
    customLoader.show(Get.overlayContext);
  }

  Location.Location location = Location.Location();

  // Check if location services are enabled
  bool serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    _isGettingLocation = false;
    customLoader.hide();
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return null; // Return null if service could not be enabled
    }
  }

  // Check if location permission is granted
  Location.PermissionStatus permissionGranted = await location.hasPermission();
  if (permissionGranted == Location.PermissionStatus.denied) {
    _isGettingLocation = false;
    customLoader.hide();
    permissionGranted = await location.requestPermission();
    if (permissionGranted != Location.PermissionStatus.granted) {
      return null; // Return null if permission is not granted
    }
  }

  // Get the current location
  Location.LocationData locationData;
  try {
    locationData = await location.getLocation();
  } catch (e) {
    _isGettingLocation = false;
    customLoader.hide();
    debugPrint('Error getting location: $e');
    return null; // Return null in case of failure while fetching the location
  }

  // Successfully fetched the location
  _isGettingLocation = false;
  customLoader.hide();
  return locationData;
}

Future<AddressDataModel> getCurrentUserAddress(
    {required double lat, required double long}) async {
  List<Placemark> placeMarks = await placemarkFromCoordinates(lat, long);

  if (placeMarks.isEmpty) {
    return AddressDataModel(
      latitude: lat,
      longitude: long,
    );
  }
  return AddressDataModel(
      latitude: lat,
      longitude: long,
      address:
          '${placeMarks[0].name ?? ''}${(placeMarks[0].locality != null ? ', ${placeMarks[0].locality}' : '')}${(placeMarks[0].administrativeArea != null ? ', ${placeMarks[0].administrativeArea}' : '')}'
              .trim(),
      title: (placeMarks[0].street ?? '').trim(),
      pincode: (placeMarks[0].postalCode ?? '').trim());
}

class AddressDataModel {
  int? id;
  String? title;
  String? description;
  String? address;
  double? latitude;
  double? longitude;
  String? pincode;
  int? isDefault;
  int? stateId;
  int? typeId;
  String? createdOn;
  int? createdById;
  String? contactNumber;
  String? countryCode;

  AddressDataModel(
      {this.id,
        this.title,
        this.description,
        this.address,
        this.latitude,
        this.longitude,
        this.pincode,
        this.stateId,
        this.isDefault,
        this.typeId,
        this.createdOn,
        this.createdById,
        this.contactNumber,
        this.countryCode});

  AddressDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    address = json['address'];
    latitude = (json['latitude'] != null &&
        json['latitude'] != '' &&
        json['latitude'].runtimeType == String)
        ? double.parse(json['latitude'])
        : 0.0;
    longitude = (json['longitude'] != null &&
        json['longitude'] != '' &&
        json['longitude'].runtimeType == String)
        ? double.parse(json['longitude'])
        : 0.0;
    pincode = json['pincode'];
    isDefault = json['is_default'] ?? 0;
    stateId = json['state_id'];
    typeId = json['type_id'];
    createdOn = json['created_on'];
    createdById = json['created_by_id'];
    contactNumber = json['contact_no'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['pincode'] = this.pincode;
    data['state_id'] = this.stateId;
    data['_is_default'] = this.isDefault;
    data['type_id'] = this.typeId;
    data['created_on'] = this.createdOn;
    data['created_by_id'] = this.createdById;
    data['contact_no'] = this.contactNumber;
    data['country_code'] = this.countryCode;
    return data;
  }
}