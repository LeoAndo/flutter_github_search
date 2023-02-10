// Project imports:
import 'package:flutter_github_search/data/api/github/github_api.dart';
import 'package:flutter_github_search/data/api/github/response/search_repositories/search_repositories_response.dart';
import 'package:flutter_github_search/domain/model/repository_summary.dart';
import '../../domain/repository/github_repo_repository.dart';

class GithubRepoRepositoryImpl implements GithubRepoRepository {
  GithubRepoRepositoryImpl();
  final GithubApi api = GithubApi();

  @override
  Future<List<RepositorySummary>> searchRepositories(
      {required String query, required int page, required int perPage}) async {
    final ret = await api.searchRepositories(
        query: query, page: page, perPage: perPage);
    return ret.toModels();
  }
}
