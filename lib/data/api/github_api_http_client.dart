// Dart imports:
import 'dart:async';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:flutter_github_search/data/api/http_handler.dart';

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
      return _httpHandler.handleResponse(response);
    }).catchError((error, stackTrace) {
      return _httpHandler.handleError(error, stackTrace);
    });
  }
}
