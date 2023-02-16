// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:flutter_github_search/data/repository/github_repo_repository_impl.dart';
import 'package:flutter_github_search/ui/component/app_error.dart';
import 'package:flutter_github_search/ui/detail/detail_screen.dart';
import '../../data/repository/fake_github_repo_repository.dart';

/// see: https://riverpod.dev/ja/docs/cookbooks/testing
void main() {
  testWidgets('stateIsSuccess', (tester) async {
    final fakeRepo = FakeGithubRepoRepository(isSuccess: true);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          githubRepoRepositoryProvider.overrideWith((ref) => fakeRepo)
        ],
        child: const MaterialApp(
          home: DetailScreen(
              ownerName: FakeGithubRepoRepository.ownerName,
              repositoryName: FakeGithubRepoRepository.repositoryName),
        ),
      ),
    );

    // 最初のフレームのステート: uiStateがintialの時のWidgetが配置されていることを確認
    expect(find.byType(Container), findsOneWidget);

    // 再描画。このあたりで githubRepoRepositoryProvider は 値の取得が終わっているはず
    await tester.pump();

    // 正常系ステート: uiStateがdataの時のWidgetの表示内容のチェック
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.text(FakeGithubRepoRepository.successData.description ?? ''),
        findsOneWidget);
    expect(find.text(FakeGithubRepoRepository.successData.language ?? ''),
        findsOneWidget);
    expect(
        find.text('${FakeGithubRepoRepository.successData.forksCount} forks'),
        findsOneWidget);
    expect(
        find.text(
            '${FakeGithubRepoRepository.successData.stargazersCount} stars'),
        findsOneWidget);
    expect(
        find.text(
            '${FakeGithubRepoRepository.successData.watchersCount} watchers'),
        findsOneWidget);
    expect(
        find.text(
            'open ${FakeGithubRepoRepository.successData.openIssuesCount} issues'),
        findsOneWidget);
  });

  testWidgets('stateIsError', (tester) async {
    final fakeRepo = FakeGithubRepoRepository(isSuccess: false);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          githubRepoRepositoryProvider.overrideWith((ref) => fakeRepo)
        ],
        child: const MaterialApp(
          home: DetailScreen(
              ownerName: FakeGithubRepoRepository.ownerName,
              repositoryName: FakeGithubRepoRepository.repositoryName),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);

    await tester.pump();

    // 異常系ステート: uiStateがerrorの時のWidgetの表示内容のチェック
    expect(find.byType(AppError), findsOneWidget);
    expect(find.text(FakeGithubRepoRepository.errorMessage), findsOneWidget);
  });
}
