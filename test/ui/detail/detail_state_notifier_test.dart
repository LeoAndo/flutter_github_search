import 'package:flutter_github_search/data/repository/github_repo_repository_impl.dart';
import 'package:flutter_github_search/ui/detail/detail_state_notifier.dart';
import 'package:flutter_github_search/ui/detail/ui_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/repository/fake_github_repo_repository.dart';

void main() {
  test('stateIsInitial', () async {
    final fakeRepo = FakeGithubRepoRepository(isSuccess: true);
    // プロバイダを利用するために必要なオブジェクト
    // このオブジェクトはテスト間で共有しない
    final container = ProviderContainer(
      overrides: [
        // githubRepoRepositoryProvider の挙動をオーバーライドして
        // Repository の代わりに FakeRepository を戻り値とする
        githubRepoRepositoryProvider.overrideWith((ref) => fakeRepo)
        // `detailStateNotifierProvider`はオーバーライドされた`githubRepoRepositoryProvider`を
        // 自動的に利用することになるため、オーバーライド不要
      ],
    );
    addTearDown(container.dispose);

    // 初期ステートが initial であることを確認
    expect(
      container.read(detailStateNotifierProvider),
      const UiState.initial(),
    );
  });
}
