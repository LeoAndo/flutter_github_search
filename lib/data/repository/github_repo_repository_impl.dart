// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_github_search/data/api/github/github_api.dart';
import 'package:flutter_github_search/data/api/github/response/search_repositories/search_repositories_response.dart';
import 'package:flutter_github_search/domain/model/repository_summary.dart';
import '../../domain/repository/github_repo_repository.dart';

final Provider githubRepoRepositoryProvider =
    Provider<GithubRepoRepository>((ref) {
  final api = ref.watch(githubApiProvider);
  return GithubRepoRepositoryImpl(api);
});

class GithubRepoRepositoryImpl implements GithubRepoRepository {
  final GithubApi _api;
  GithubRepoRepositoryImpl(this._api);

  @override
  Future<List<RepositorySummary>> searchRepositories(
      {required String query, required int page}) async {
    // final api = _ref.read(githubApiProvider);
    final ret = await _api.searchRepositories(query: query, page: page);
    return ret.toModels();
  }
}
