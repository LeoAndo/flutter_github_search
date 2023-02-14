// Package imports:
import 'package:flutter_github_search/data/api/github/github_api.dart';
import 'package:flutter_github_search/domain/exception/application_exception.dart';
import 'package:flutter_github_search/domain/exception/validation_exceptions.dart';
import 'package:flutter_github_search/domain/model/repository_summary.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../data/repository/github_repo_repository_impl.dart';
import '../../../domain/repository/github_repo_repository.dart';
import 'ui_state.dart';

// Project imports:

final searchPagingStateNotifierProvider =
    StateNotifierProvider.autoDispose<SearchPagingStateNotifier, UiState>(
        (ref) {
  final repository = ref.watch(githubRepoRepositoryProvider);
  return SearchPagingStateNotifier(repository);
});

class SearchPagingStateNotifier extends StateNotifier<UiState> {
  SearchPagingStateNotifier(this._repository) : super(const UiState.initial());
  final GithubRepoRepository _repository;

  void searchRepositories(
      {required String query, required int page, bool refresh = false}) async {
    Logger().d('ando searchRepositories page: $page, refresh: $refresh');
    final List<RepositorySummary> repositories =
        (refresh) ? [] : state.repositories;
    try {
      if (query.isEmpty) {
        throw const InputValidationException("please input search word.");
      }
      state = UiState.loading(
          repositories: repositories, nextPageNo: state.nextPageNo);

      final newItems =
          await _repository.searchRepositories(query: query, page: page);
      final isLastPage = newItems.length < GithubApi.perPage;
      if (isLastPage) {
        state = UiState.data(
            repositories: repositories + newItems, nextPageNo: null);
      } else {
        page++;
        state = UiState.data(
            repositories: repositories + newItems, nextPageNo: page);
      }
    } on ApplicationException catch (e) {
      state = UiState.error(
          repositories: repositories,
          nextPageNo: state.nextPageNo,
          exception: e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    Logger().d('ando SearchPagingStateNotifier call dispose');
  }
}
