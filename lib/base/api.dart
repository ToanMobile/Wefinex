import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:wefinex/shared/constant/common.dart';

final hive = Hive.box('myBox');
enum Method { GET, POST }

/// This class must be instantiated in the [Repositories] class
/// core of the custom API networking
class ApiService {
  _Api _api = _Api();

  Future<Response> callData({Method method = Method.GET, String? baseUrl, required String endPoint, Map<String, String>? query, bool withToken = false}) async {
    return await _api.callData(method: method, endPoint: endPoint, param: query, withToken: withToken);
  }
}

/// PRIVATE CLASS
/// USE THIS VIA [ApiService] class
class _Api extends GetConnect {
  bool _withToken = false;

  @override
  void onInit() async {
    httpClient.baseUrl = Common().myConfig.BASE_URL_COIN;
    /*httpClient.addRequestModifier((request) {
      request.headers['platform'] = pf;
      request.headers['device-id'] = "$deviceId";
      request.headers['device-name'] = "$deviceName";
      _showLogWhenDebug("_withToken",_withToken.toString());
      if (_withToken){
        String token = Common().myConfig.TOKEN_STRING_KEY;
        if(token != null)request.headers['X-Auth-Token'] = "$token";
      }
      _showLogWhenDebug("HEADERS",request.headers.toString());
      return request;
    });*/
    httpClient.maxAuthRetries = 2;
    super.onInit();
  }

  /// FOR NETWORKING WITH [Method.POST] / [Method.GET]
  /// RETURN DATA WITH [Result.body] MODELS and please parse with your model
  Future<Response> callData({Method method = Method.GET, String endPoint = "", Map<String, String>? param, bool withToken = false}) async {
    _withToken = withToken;
    onInit();
    _showLogWhenDebug(method == Method.GET ? "GET" : "POST", (httpClient.baseUrl ?? "") + endPoint);
    _showLogWhenDebug("PARAMS", query.toString());
    _showLogWhenDebug("TOKEN", _withToken.toString());
    try {
      var response;
      if (method == Method.GET) {
        response = await get(endPoint, query: param);
      } else {
        response = await post(endPoint, param);
      }
      _showLogWhenDebug("LOADED", response.bodyString);
      return Response(statusCode: 200, body: response.bodyString);
    } catch (e) {
      _showLogWhenDebug("ERROR 1", e.toString());
      return Response(statusCode: 201);
    }
  }

  /// TO SHOW THE LOG WHEN DEBUG MODE TRUE
  _showLogWhenDebug(String status, String? e) {
    if (kDebugMode) log("$status => ${e.toString()}", name: Common().myConfig.APP_NAME);
  }
}
