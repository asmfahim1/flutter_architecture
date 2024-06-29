import 'dart:convert';
import 'dart:io';
import 'package:flutter_architecture/data/app_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final Map<String, String> headers;

  ApiClient({required this.baseUrl, required this.headers});

  Future<http.Response> get(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'), headers: headers).timeout(const Duration(seconds: 10));
      _handleResponse(response);
      return response;
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
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers,
        body: json.encode(body),
      ).timeout(const Duration(seconds: 10));
      _handleResponse(response);
      return response;
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
  }

  Future<http.Response> put(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers,
        body: json.encode(body),
      ).timeout(const Duration(seconds: 10));
      _handleResponse(response);
      return response;
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
  }

  Future<http.Response> delete(String endpoint) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl$endpoint'), headers: headers).timeout(const Duration(seconds: 10));
      _handleResponse(response);
      return response;
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
  }

  Future<http.Response> uploadFile(String endpoint, File file) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl$endpoint'));
      request.headers.addAll(headers);
      request.files.add(await http.MultipartFile.fromPath('file', file.path).timeout(const Duration(seconds: 10)));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      _handleResponse(response);
      return response;
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
  }

  Future<http.Response> uploadImage(String endpoint, File imageFile) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl$endpoint'));
      request.headers.addAll(headers);
      request.files.add(await http.MultipartFile.fromPath('image', imageFile.path).timeout(const Duration(seconds: 10)));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      _handleResponse(response);
      return response;
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
  }

  dynamic _handleResponse(http.Response response) {

      switch (response.statusCode) {
        case 200:
          dynamic responseJson = jsonDecode(response.body);
          return responseJson;
        case 400:
          throw Exception('Bad request: ${response.body}');
        case 401:
          throw Exception('Unauthorized: ${response.body}');
        case 403:
          throw Exception('Forbidden: ${response.body}');
        case 404:
          throw Exception('Not found: ${response.body}');
        case 500:
          throw Exception('Internal server error: ${response.body}');
        default:
          throw Exception('Error: ${response.statusCode} - ${response.body}');
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
        throw FetchDataException(
            'Error occurred while communicating with server ${response.statusCode}');
    }
  }


}
