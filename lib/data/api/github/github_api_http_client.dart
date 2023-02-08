import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../../../domain/exception/api_exceptions.dart';

class GithubApiHttpClient extends http.BaseClient {
  static const String _accessToken = "INPUT HERE TOKEN";
  final Map<String, String> _headers = <String, String>{
    'Accept': 'application/vnd.github.v3+json',
    'Authorization': 'Bearer $_accessToken',
    'X-GitHub-Api-Version': '2022-11-28',
  };
  final http.Client _inner = http.Client();

  GithubApiHttpClient();
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    _headers.forEach((key, value) {
      request.headers[key] = value;
    });
    return _inner.send(request).timeout(const Duration(seconds: 20));
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    return super.get(url, headers: headers).then((response) {
      return _handleResponse(response);
    }).catchError((error, stackTrace) {
      _handleError(error, stackTrace);
    });
  }

  http.Response _handleResponse(http.Response response) {
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

  _handleError(dynamic error, dynamic stackTrace) {
    if (error is UnAuthorizedException) {
      throw error;
    } else if (error is TimeoutException) {
      throw NetworkException(error.toString());
    } else if (error is http.ClientException) {
      throw NetworkException(error.toString());
    } else {
      throw error;
    }
  }
}
