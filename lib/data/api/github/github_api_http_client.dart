// Dart imports:
import 'dart:async';
import 'dart:convert' as convert;

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:flutter_github_search/data/api/http_handler.dart';
import 'package:flutter_github_search/domain/exception/api_exceptions.dart';

class GithubApiHttpClient extends http.BaseClient {
  // static const String _accessToken = "INPUT HERE TOKEN";
  final Map<String, String> _headers = <String, String>{
    'Accept': 'application/vnd.github.v3+json',
    // 'Authorization': 'Bearer $_accessToken',
    'X-GitHub-Api-Version': '2022-11-28',
  };
  final http.Client _client = http.Client();
  final HttpHandler _httpHandler = const HttpHandler();

  GithubApiHttpClient();
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    _headers.forEach((key, value) {
      request.headers[key] = value;
    });
    return _client.send(request).timeout(const Duration(seconds: 20));
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    return super.get(url, headers: headers).then((response) {
      return _dataOrThrow(response);
    }).catchError((error, stackTrace) {
      return _httpHandler.handleError(error, stackTrace);
    });
  }

  http.Response _dataOrThrow(http.Response response) {
    final json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      return response; // 正常系はそのままレスポンス値を返す。
    } else if (statusCode >= 300 && statusCode <= 399) {
      final msg = '${json['message']} : ${json['documentation_url']}';
      throw RedirectException(msg);
    } else if (statusCode == 401) {
      final msg = '${json['message']} : ${json['documentation_url']}';
      throw UnAuthorizedException(msg);
    } else if (statusCode == 403) {
      final msg = '${json['message']} : ${json['documentation_url']}';
      throw ForbiddenExeption(msg);
    } else if (statusCode == 404) {
      final msg = '${json['message']} : ${json['documentation_url']}';
      throw NotFoundException(msg);
    } else if (statusCode == 422) {
      final msg = '${json['message']} : ${json['documentation_url']}';
      throw UnprocessableEntityException(msg);
    } else if (statusCode >= 500 && statusCode <= 599) {
      final msg = '${json['message']} : ${json['documentation_url']}';
      throw ServerException(msg);
    } else {
      throw const UnknownException("Unhandled Exception");
    }
  }
}
