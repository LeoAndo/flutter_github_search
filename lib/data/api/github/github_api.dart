import 'dart:convert' as convert;

import 'package:flutter_github_search/domain/exception/api_exceptions.dart';

import 'github_api_http_client.dart';

class GithubApi {
  static const _authority = 'api.github.com';
  final client = GithubApiHttpClient();
  void searchRepositories(
      {required String query,
      required int page,
      required int perPage,
      String sort = "stars"}) async {
    try {
      final queryParameters = <String, String>{
        'q': query,
        'page': page.toString(),
        'per_page': perPage.toString(),
        'sort': sort,
      };
      final response = await client
          .get(Uri.https(_authority, '/search/repositories', queryParameters));
      //final json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    } on ApiException catch (_) {}
  }
}
