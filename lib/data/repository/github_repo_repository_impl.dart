// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../data/api/github/response/fetch_repository_detail/repository_detail_res.dart';
import '../../data/api/github/response/search_repositories/search_repositories_response.dart';
import '../../domain/model/repository_detail.dart';
import '../../domain/model/repository_summary.dart';
import '../../domain/repository/github_repo_repository.dart';
import '../api/github/github_api.dart';

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
    final ret = await _api.searchRepositories(query: query, page: page);
    return ret.toModels();
  }

  @override
  Future<RepositoryDetail> fetchRepositoryDetail(
      {required String ownerName, required String repositoryName}) async {
    final ret = await _api.fetchRepositoryDetail(
        ownerName: ownerName, repositoryName: repositoryName);
    return ret.toModel();
  }
}
