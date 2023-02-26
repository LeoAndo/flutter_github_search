// Project imports:
import 'package:flutter_github_search/domain/exception/api_exceptions.dart';
import 'package:flutter_github_search/domain/model/repository_detail.dart';
import 'package:flutter_github_search/domain/model/repository_summary.dart';
import 'package:flutter_github_search/domain/repository/github_repo_repository.dart';

class FakeGithubRepoRepository implements GithubRepoRepository {
  FakeGithubRepoRepository({required this.isSuccess});
  static const ownerName = "flutter";
  static const repositoryName = "flutter";
  static const successData = RepositoryDetail(
    name: "flutter",
    ownerAvatarUrl: "https://avatars.githubusercontent.com/u/14101776?v=4",
    stargazersCount: 147731,
    forksCount: 24075,
    openIssuesCount: 11390,
    watchersCount: 3561,
    language: "Dart",
    description: "Hello, Flutter",
  );
  final bool isSuccess;
  static const errorMessage = 'network error';
  static const ApiException errorData = NetworkException(errorMessage);
  @override
  Future<List<RepositorySummary>> searchRepositories(
      {required String query, required int page}) async {
    return [];
  }

  @override
  Future<RepositoryDetail> getRepositoryDetail(
      {required String ownerName, required String repositoryName}) async {
    return (isSuccess) ? successData : throw errorData;
  }
}
