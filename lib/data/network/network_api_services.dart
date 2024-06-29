import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_architecture/data/app_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_architecture/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {

  @override
  Future<dynamic> getApi(url) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on SocketException {
      throw InternetExceptions('');
    } on FormatException {
      throw FormatException('');
    } on HttpException {
      throw HttpException('');
    } on NoSuchMethodError {
      throw NoSuchMethodError('');
    }
    return responseJson;
  }


  @override
  Future<dynamic> postApi(var data, url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;

    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on SocketException {
      throw InternetExceptions('');
    } on FormatException {
      throw FormatException('');
    } on HttpException {
      throw HttpException('');
    } on NoSuchMethodError {
      throw NoSuchMethodError('');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
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
        throw FetchDataException(
            'Error occurred while communicating with server ${response.statusCode}');
    }
  }
}
