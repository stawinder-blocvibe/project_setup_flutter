  

import 'package:base_project/app/export.dart';
import 'package:dio/io.dart';


import '../../core/widget/device_details.dart';


const _defaultConnectTimeout =
    Duration(milliseconds: Duration.millisecondsPerMinute);
const _defaultReceiveTimeout =
    Duration(milliseconds: Duration.millisecondsPerMinute);

final PreferenceManger _preferenceManger = Get.find<PreferenceManger>();

setContentType() {
  return "application/json";
}

class DioClient {
  String baseUrl;

  static late Dio _dio;

  final List<Interceptor>? interceptors;

  DioClient(
    this.baseUrl,
    Dio dio, {
    this.interceptors,
  }) {
    _dio = dio;
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.contentType = setContentType()
      ..options.headers = {
        'Content-Type': setContentType(),
        // 'Accept-Language':'zh-cn'
      };

    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }
    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: false,
          requestBody: true));
    }
  }

  Future<dynamic> get(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      bool? skipAuth,
       data
      }) async {
    try {
      if (skipAuth == false) {
        var token = _preferenceManger.getAuthToken();
        debugPrint("token $token");
        if (token != null) {

          options = Options(
              headers: {"Authorization": "Bearer $token", "lang": localKey});

        }
      } else {
        options ??= Options(
          headers: {
            'User-Agent': await getUserAgent(),
          },
        );
      }

      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        data: data
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      bool? isLoading = true,
      bool? skipAuth}) async {
    try {
      if (skipAuth == false) {
        var token = _preferenceManger.getAuthToken();
        if (token != null) {
          options ??= Options(
            headers: {
              "Authorization": "Bearer $token",
              'User-Agent': await getUserAgent(),
            },
          );
        }
      } else {
        options ??= Options(
          headers: {
            'User-Agent': await getUserAgent(),
          },
        );
      }
      if (isLoading == true) {
        customLoader.show(Get.context);
      }
      debugPrint("url============ $uri");
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (isLoading == true) {
        customLoader.hide();
      }
      return response.data;
    } on FormatException catch (_) {
      if (isLoading == true) {
        customLoader.hide();
      }
      throw const FormatException("Unable to process the data");
    } catch (e) {
      if (isLoading == true) {
        customLoader.hide();
      }
      rethrow;
    }
  }

   Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future getUserAgent() async {
    DeviceDetails details = DeviceDetails();
    DeviceInfoPlugin info = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await info.androidInfo;
      details.deviceName = androidDeviceInfo.model;
      details.deviceVersion = androidDeviceInfo.version.release;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await info.iosInfo;
      details.deviceName = iosDeviceInfo.model;
      details.deviceVersion = iosDeviceInfo.systemVersion;
    }
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    debugPrint(
        "Development/FoodApp_Customer/${packageInfo.version} (${details.deviceName} / Android version:${details.deviceVersion})");
    return "Development/FoodApp_Customer/${packageInfo.version} (${details.deviceName} / Android version:${details.deviceVersion})";
  }

}

