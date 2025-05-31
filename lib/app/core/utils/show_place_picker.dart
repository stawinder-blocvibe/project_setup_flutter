// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:foodcustomer/app/export.dart';
// import 'package:google_maps_webservice/src/places.dart';
//
// Future<AddressDataModel> showPlacePicker({required String hintText}) async {
//
//   AddressDataModel addressDataModel = AddressDataModel();
//   await PlacesAutocomplete.show(
//       context: Get.context!,
//       apiKey: googleApiKey,
//       mode: Mode.fullscreen,
//       strictbounds: false,
//       types: [],
//       components: [],
//       decoration: InputDecoration(
//           fillColor: Colors.white,
//           focusColor: Colors.white,
//           filled: true,
//           prefixIconColor: Colors.white,
//           labelStyle: textStyleTitleMedium()
//               .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
//           hintStyle: textStyleTitleMedium()
//               .copyWith(fontWeight: FontWeight.w500, color: greyTextColor),
//           hintText: hintText))
//       .then((p) async {
//     if (p != null) {
//       GoogleMapsPlaces _places = GoogleMapsPlaces(
//         apiKey: googleApiKey,
//         // apiHeaders: await GoogleApiHeaders().getHeaders(),
//       );
//       PlacesDetailsResponse detail =
//       await _places.getDetailsByPlaceId(p.placeId ?? '');
//       if (detail.result.geometry != null) {
//         addressDataModel = AddressDataModel(
//             latitude: detail.result.geometry!.location.lat,
//             longitude: detail.result.geometry!.location.lng,
//             address: p.description);
//       }
//     }
//   }).onError((error, stackTrace) {
//
//   });
//   return addressDataModel;
// }
