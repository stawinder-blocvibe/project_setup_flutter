import 'dart:math';

class DistanceProvider {
  static double getDistanceBetweenLatLong(
      {required double lat1,
      required double lon1,
      required double lat2,
      required double lon2}) {
    const r = 6372.8; // Earth radius in kilometers

    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);
    final lat1Radians = _toRadians(lat1);
    final lat2Radians = _toRadians(lat2);

    final a =
        _haversin(dLat) + cos(lat1Radians) * cos(lat2Radians) * _haversin(dLon);
    final c = 2 * asin(sqrt(a));

    return (r * c);
  }

  static double _toRadians(double degrees) => degrees * pi / 180;

  static num _haversin(double radians) => pow(sin(radians / 2), 2);

  //result in km
}
