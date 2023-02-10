// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'package:flutter_github_search/data/repository/github_repo_repository_impl.dart';
import 'package:flutter_github_search/domain/exception/api_exceptions.dart';
import 'package:flutter_github_search/domain/repository/github_repo_repository.dart';
import 'package:flutter_github_search/ui/search/ui_state.dart';

final searchStateNotifierProvider =
    StateNotifierProvider.autoDispose<SearchStateNotifier, UiState>((ref) {
  final repository = ref.watch(githubRepoRepositoryProvider);
  return SearchStateNotifier(repository);
});

class SearchStateNotifier extends StateNotifier<UiState> {
  SearchStateNotifier(this._repository) : super(const UiState.initial());
  final GithubRepoRepository _repository;

  void searchRepositories({required String query}) async {
    try {
      state = const UiState.loading();
      await Future.delayed(const Duration(seconds: 3));
      final repositories =
          await _repository.searchRepositories(query: query, page: 1);
      state = UiState.data(repositories);
    } on ApiException catch (e) {
      state = UiState.error(e);
    }
  }

  @override
  void dispose() {
    Logger().d('ando SearchStateNotifier call dispose');
    super.dispose();
  }
}
