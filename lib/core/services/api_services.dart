import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:point_of_sale/core/config/config.dart';

import '../../locator.dart';
import '../response/base_responses/request_response.dart';

class ApiServices {
  final _config = locator<Config>();
  final log = Logger();
  //
  Future<Dio> launchDio() async {
    // String? accessToken = locator<LocalStorageService>().accessToken;
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    // dio.interceptors.add(
    //     DioCacheManager(CacheConfig(baseUrl: EndPoint.baseUrl)).interceptor);
    dio.options.baseUrl = 'https://pointofsale.antonx.com/public/api/';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["accept"] = 'application/json';
    dio.options.headers["Authorization"] = 'Bearer ' '';

    dio.options.followRedirects = false;
    dio.options.validateStatus = (s) {
      if (s != null) {
        return s < 500;
      } else {
        return false;
      }
    };
    return dio;
  }

  get({required String endPoint, params}) async {
    try {
      Dio dio = await launchDio();
      final response = await dio.get(endPoint, queryParameters: params);
      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      ///
      /// The request was made and the server responded with a status code
      /// that falls out of the range of 2xx and is also not 304.
      ///
      if (e.response != null) {
        log.e(
            '@get - Server error \n Data: \n${e.response!.data} \n Request Header: ${e.response!.headers} \n Request Options: ${e.response!.requestOptions}');
        return RequestResponse.fromJson(
            'Server error with error code: ${e.response!.statusCode}');
      } else {
        ///
        /// Something happened in setting up or sending the request that triggered an Error
        ///

        log.e(
            '@get - Internal dio error \n Request options: \n${e.requestOptions} \n Request Header: ${e.response?.headers} \n Request Options: ${e.response?.requestOptions}');
        return RequestResponse.fromJson(
            'Internet request failed with error: ${e.message}. Please make sure you have stable internet connection');
      }
    }
  }

  post({required String endPoint, data}) async {
    try {
      Dio dio = await launchDio();
      final response = await dio.post(endPoint, data: data);
      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      ///
      /// The request was made and the server responded with a status code
      /// that falls out of the range of 2xx and is also not 304.
      ///
      if (e.response!.statusCode == 500) {
        log.e(
            '@get - Server error \n Data: \n${e.response!.data} \n Request Header: ${e.response!.headers} \n Request Options: ${e.response!.requestOptions}');
        return RequestResponse(false,
            error: 'Server error with error code: ${e.response!.statusCode}');
      } else {
        ///
        /// Something happened in setting up or sending the request that triggered an Error
        ///

        log.e(
            '@get - Internal dio error \n Request options: \n${e.requestOptions} \n Request Header: ${e.response?.headers} \n Request Options: ${e.response?.requestOptions}');
        return RequestResponse(false,
            error:
                'Internet request failed with error: ${e.message}. Please make sure you have stable internet connection');
      }
    }
  }

  put({required String endPoint, data}) async {
    try {
      Dio dio = await launchDio();
      final response = await dio.put(endPoint, data: data);
      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      ///
      /// The request was made and the server responded with a status code
      /// that falls out of the range of 2xx and is also not 304.
      ///
      if (e.response != null) {
        log.e(
            '@get - Server error \n Data: \n${e.response!.data} \n Request Header: ${e.response!.headers} \n Request Options: ${e.response!.requestOptions}');
        return RequestResponse.fromJson(
            'Server error with error code: ${e.response!.statusCode}');
      } else {
        ///
        /// Something happened in setting up or sending the request that triggered an Error
        ///

        log.e(
            '@get - Internal dio error \n Request options: \n${e.requestOptions} \n Request Header: ${e.response!.headers} \n Request Options: ${e.response!.requestOptions}');
        return RequestResponse.fromJson(
            'Internet request failed with error: ${e.message}. Please make sure you have stable internet connection');
      }
    }
  }

  delete({required String endPoint, params}) async {
    try {
      Dio dio = await launchDio();
      final response = await dio.delete('${_config.baseUrl}$endPoint',
          queryParameters: params);
      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      ///
      /// The request was made and the server responded with a status code
      /// that falls out of the range of 2xx and is also not 304.
      ///
      if (e.response != null) {
        log.e(
            '@get - Server error \n Data: \n${e.response!.data} \n Request Header: ${e.response!.headers} \n Request Options: ${e.response!.requestOptions}');
        return RequestResponse.fromJson(
            'Server error with error code: ${e.response!.statusCode}');
      } else {
        ///
        /// Something happened in setting up or sending the request that triggered an Error
        ///

        log.e(
            '@get - Internal dio error \n Request options: \n${e.requestOptions} \n Request Header: ${e.response!.headers} \n Request Options: ${e.response!.requestOptions}');
        return RequestResponse.fromJson(
            'Internet request failed with error: ${e.message}. Please make sure you have stable internet connection');
      }
    }
  }
}
