// Project imports:
import 'package:flutter_github_search/domain/model/repository_summary.dart';

abstract class GithubRepoRepository {
  Future<List<RepositorySummary>> searchRepositories({
    required String query,
    required int page,
    required int perPage,
  });
}
