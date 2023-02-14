// Package imports:
import 'package:flutter_github_search/data/api/github/github_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../data/repository/github_repo_repository_impl.dart';
import '../../../domain/exception/api_exceptions.dart';
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

  void searchRepositories({required String query, required int page}) async {
    try {
      if (query.isEmpty) throw const ForbiddenExeption("query is empty error.");

      final newItems =
          await _repository.searchRepositories(query: query, page: page);
      final isLastPage = newItems.length < GithubApi.perPage;
      if (isLastPage) {
        state = UiState.data(
            repositories: newItems, isLastPage: isLastPage, nextPageNo: null);
      } else {
        page++;
        state = UiState.data(
            repositories: newItems, isLastPage: isLastPage, nextPageNo: page);
      }
    } on ApiException catch (e) {
      state = UiState.error(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    Logger().d('ando SearchPagingStateNotifier call dispose');
  }
}
