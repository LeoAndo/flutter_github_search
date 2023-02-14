// Dart imports:
import 'dart:convert' as convert;

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import './response/search_repositories/search_repositories_response.dart';
import 'github_api_http_client.dart';
import 'response/fetch_repository_detail/repository_detail_res.dart';

final Provider githubApiProvider = Provider<GithubApi>((_) {
  return GithubApi();
});

class GithubApi {
  static const _authority = String.fromEnvironment('githubApiDomain');
  static const perPage = 20;
  final client = GithubApiHttpClient();
  Future<SearchRepositoriesResponse> searchRepositories(
      {required String query,
      required int page,
      int perPage = perPage,
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

  Future<RepositoryDetailRes> fetchRepositoryDetail(
      {required String ownerName, required String repositoryName}) async {
    final response = await client
        .get(Uri.https(_authority, '/repos/$ownerName/$repositoryName'));
    final json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    return RepositoryDetailRes.fromJson(json);
  }
}
