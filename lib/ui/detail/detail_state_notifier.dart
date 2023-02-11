// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'package:flutter_github_search/data/repository/github_repo_repository_impl.dart';
import 'package:flutter_github_search/domain/exception/api_exceptions.dart';
import 'package:flutter_github_search/domain/repository/github_repo_repository.dart';
import 'ui_state.dart';

final detailStateNotifierProvider =
    StateNotifierProvider.autoDispose<DetailStateNotifier, UiState>((ref) {
  final repository = ref.watch(githubRepoRepositoryProvider);
  return DetailStateNotifier(repository);
});

class DetailStateNotifier extends StateNotifier<UiState> {
  DetailStateNotifier(this._repository) : super(const UiState.initial());
  final GithubRepoRepository _repository;

  void fetchRepositoryDetail(
      {required String ownerName, required String repositoryName}) async {
    try {
      state = const UiState.loading();
      final data = await _repository.fetchRepositoryDetail(
          ownerName: ownerName, repositoryName: repositoryName);
      state = UiState.data(data);
    } on ApiException catch (e) {
      state = UiState.error(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    Logger().d('ando DetailStateNotifier call dispose');
  }
}
