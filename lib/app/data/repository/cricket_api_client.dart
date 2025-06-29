


import 'package:dio/dio.dart';

class CricketApiClient {
  final Dio _dio;

  CricketApiClient()
      : _dio = Dio(BaseOptions(
    baseUrl: 'https://cricket-api.elitesportapi.com/api/v2/',
    headers: {
      // 'Authorization': 'Bearer $apiKey', // or just 'apiKey': apiKey if required
      'Accept': 'application/json',
    },
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Future<dynamic> getLiveMatch(String matchId) async {
    try {
      final response = await _dio.get(
        'getLiveMatch',
        queryParameters: {
          'matchId': matchId,
        },
      );
      return response.data;
    } catch (e) {
      print("API Error: $e");
      rethrow;
    }
  }
}
