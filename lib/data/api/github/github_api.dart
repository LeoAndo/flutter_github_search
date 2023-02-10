// Dart imports:
import 'dart:convert' as convert;

// Project imports:
import './response/search_repositories/search_repositories_response.dart';
import 'github_api_http_client.dart';

class GithubApi {
  static const _authority = 'api.github.com';
  final client = GithubApiHttpClient();
  Future<SearchRepositoriesResponse> searchRepositories(
      {required String query,
      required int page,
      required int perPage,
      String sort = "stars"}) async {
    final queryParameters = <String, String>{
      'q': query,
      'page': page.toString(),
      'per_page': perPage.toString(),
      'sort': sort,
    };
    final response = await client
        .get(Uri.https(_authority, '/search/repositories', queryParameters));
    final json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    return SearchRepositoriesResponse.fromJson(json);
  }
}
