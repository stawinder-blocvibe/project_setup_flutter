import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';

import '../../export.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// Modify Suggestion object according to the info you want
@immutable
class Suggestion {
  final String placeId;
  final String description;
  const Suggestion(this.placeId, this.description);
}

class PlaceApiProvider {
  final Client client = Client();
  // IMPORTANT: sessionToken lets you reduce costs by not request-ing the API for autocomplete
  // on every character that you type.
  final String? sessionToken;
  // Load the API key from .env file
  static final String apiKey = mapApiKey ??
      'AIzaSyBOq7xrsLQuvtndQotLJi3_Rv-ku7162_I' ??
      'AIzaSyAELCSl9HVpJne8uaAJd2LvAp6OC5fPyOg';
  // mapApiKey ?? 'AIzaSyAELCSl9HVpJne8uaAJd2LvAp6OC5fPyOg';
  /*??
      'mapApiKey;*/
  // dotenv.get('GOOGLE_MAPS_API_KEY', fallback: 'key_not_found');
  PlaceApiProvider(this.sessionToken);

  Future<List<Suggestion>> fetchSuggestionsNew(
      String input, String languageCode) async {
    if (input.isEmpty) return <Suggestion>[];

    final params = {
      'input': input,
      'language': languageCode,
      'key': apiKey, // From your environment/config
      'sessiontoken': sessionToken,
    };
    final Uri requestUri = Uri.https(
        'maps.googleapis.com', '/maps/api/place/autocomplete/json', params);

    try {
      final response = await client.get(requestUri);

      debugPrint('responceA---->${response.body}');
      if (response.statusCode == 200) {
        return _parseSuggestions(response.body);
      } else {
        throw Exception(
            'Failed to fetch suggestions: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Request failed: $e');
    }
  }

  List<Suggestion> _parseSuggestions(String responseBody) {
    final result = jsonDecode(responseBody);
    if (result['predictions'] == null) return [];
    return result['predictions']
        .map<Suggestion>((json) => Suggestion(
            json['place_id'] as String, json['description'] as String))
        .toList();
  }

  Future<LatLng> getPlaceCoordinatesFromId(String placeId) async {
    // You might need to change this API endpoint if it gets deprecated
    const baseUrl = 'maps.googleapis.com';
    const path = '/maps/api/place/details/json';
    final params = {
      'place_id': placeId,
      'key': apiKey,
      'fields': 'geometry',
      'sessiontoken': sessionToken,
    };
    final Uri requestUri = Uri.https(baseUrl, path, params);
    try {
      final response = await client.get(requestUri);
      if (response.statusCode == 200) {
        debugPrint('response>>${response.body}');
        return _parseCoordinates(response.body);
      } else {
        throw Exception(
            'Failed to load place coordinates: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Request failed: $e');
    }
  }

  LatLng _parseCoordinates(String responseBody) {
    final result = jsonDecode(responseBody);
    if (result.containsKey('result') &&
        result['result'].containsKey('geometry') &&
        result['result']['geometry']['location'].containsKey('lat') &&
        result['result']['geometry']['location'].containsKey('lng')) {
      final latitude = result['result']['geometry']['location']['lat'];
      final longitude = result['result']['geometry']['location']['lng'];
      return LatLng(latitude, longitude);
    }
    return const LatLng(0, 0);
  }
}
