// Dart imports:
import 'dart:async';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:flutter_github_search/domain/exception/api_exceptions.dart';

// Project imports:

class HttpHandler {
  const HttpHandler();

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
