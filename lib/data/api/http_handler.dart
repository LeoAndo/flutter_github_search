// Dart imports:
import 'dart:async';
import 'dart:convert' as convert;

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import '../../domain/exception/api_exceptions.dart';

class HttpHandler {
  const HttpHandler();

  http.Response handleResponse(http.Response response) {
    final json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      return response; // 正常系はそのままレスポンス値を返す。
    } else if (statusCode >= 300 && statusCode <= 399) {
      throw RedirectException(json['message'], json['documentation_url']);
    } else if (statusCode == 401) {
      throw UnAuthorizedException(json['message'], json['documentation_url']);
    } else if (statusCode == 403) {
      throw ForbiddenExeption(json['message'], json['documentation_url']);
    } else if (statusCode == 404) {
      throw NotFoundException(json['message'], json['documentation_url']);
    } else if (statusCode == 422) {
      throw UnprocessableEntityException(
          json['message'], json['documentation_url']);
    } else if (statusCode >= 500 && statusCode <= 599) {
      throw ServerException(json['message'], json['documentation_url']);
    } else {
      throw const UnknownException("Unhandled Exception");
    }
  }

  handleError(dynamic error, dynamic stackTrace) {
    if (error is TimeoutException) {
      throw NetworkException(error.toString());
    } else if (error is http.ClientException) {
      throw NetworkException(error.toString());
    } else {
      throw error;
    }
  }
}
