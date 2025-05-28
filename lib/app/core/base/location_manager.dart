import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../export.dart';

// Global variable to store current position
Position? currentPosition;

// Class to manage location updates
class LocationManager {
  static Timer? _timer;

  // Initialize location tracking
  static Future<void> startLocationTracking() async {
    // Check location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint('Location permissions are denied');
        return;
      }
    }

    // Get initial position
    await updatePosition();

    // Start periodic updates (every 5 seconds)
    _timer = Timer.periodic(Duration(minutes: 2), (timer) async {
      await updatePosition();
    });
  }

  // Update current position
  static Future<void> updatePosition() async {
    try {
      currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      debugPrint(
          'Updated position: ${currentPosition?.latitude}, ${currentPosition?.longitude}');
    } catch (e) {
      debugPrint('Error getting location: $e');
    }
  }

  // Stop location tracking
  static void stopLocationTracking() {
    _timer?.cancel();
  }

  // Get current latitude and longitude
  static LatLng? getCurrentLatLng() {
    if (currentPosition != null) {
      return LatLng(currentPosition!.latitude, currentPosition!.longitude);
      /*  return {
        'latitude': currentPosition!.latitude,
        'longitude': currentPosition!.longitude
      };*/
    }
    return null;
  }
}
