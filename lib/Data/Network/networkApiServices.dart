import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_mvvm/Data/AppExceptions.dart';
import 'package:getx_mvvm/Data/Network/baseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions();
    } on TimeoutException {
      RequestTimeOut();
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
    }
    if (kDebugMode) {
      print(data);
    }
    final responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions();
    } on TimeoutException {
      throw RequestTimeOut();
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
    case 400:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
    default:
      throw FetchDataException('Error While Communicating To The Server' +
          response.statusCode.toString());
  }
}
