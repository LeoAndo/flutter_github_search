// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_github_search/domain/exception/application_exception.dart';
import 'package:flutter_github_search/domain/exception/validation_exceptions.dart';
import 'package:flutter_github_search/ui/search/pagination/search_paging_notifier.dart';
import 'package:flutter_github_search/ui/search/pagination/ui_state.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'package:flutter_github_search/domain/model/repository_summary.dart';
import 'package:flutter_github_search/ui/detail/detail_screen.dart';
import '../../../domain/exception/api_exceptions.dart';
import '../../components/app_error.dart';
import '../../components/app_loading.dart';

class SearchPagingScreen extends ConsumerStatefulWidget {
  const SearchPagingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchPagingScreenState();
}

class _SearchPagingScreenState extends ConsumerState<SearchPagingScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Logger().d('ando _SearchPagingScreenState call initState');
  }

  @override
  void dispose() {
    super.dispose();
    Logger().d('ando _SearchPagingScreenState call dispose');
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Paging Screen'),
        ),
        body: _buildBody(ref));
  }

  Widget _buildBody(WidgetRef ref) {
    final uiState = ref.watch(searchPagingStateNotifierProvider);
    return uiState.when(
      loading: () {
        return AppLoading(
          mainWidget: _buildMainWidget(
            onFieldSubmitted: (_) {},
          ),
        );
      },
      initial: () => _buildMainWidget(
          child: _buildListView(
            uiState: uiState,
            nextPageNo: null,
            repositories: [],
            onTap: (_) {},
          ),
          onFieldSubmitted: (String value) {
            ref
                .read(searchPagingStateNotifierProvider.notifier)
                .searchRepositories(query: value, page: 1);
          }),
      data: (repositories, isLastPage, nextPageNo) => _buildMainWidget(
          child: _buildListView(
            uiState: uiState,
            nextPageNo: nextPageNo,
            repositories: repositories,
            onTap: (repository) {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => DetailScreen(
                    ownerName: repository.ownerName,
                    repositoryName: repository.name,
                  ),
                ),
              );
            },
          ),
          onFieldSubmitted: (String value) {
            ref
                .read(searchPagingStateNotifierProvider.notifier)
                .searchRepositories(query: value, page: 1);
          }),
      error: (ApplicationException e) {
        return AppError(
          message: e.message,
          onReload: () {
            ref
                .read(searchPagingStateNotifierProvider.notifier)
                .searchRepositories(
                    query: _textEditingController.text, page: 1);
          },
          mainWidget: _buildMainWidget(onFieldSubmitted: (String value) {
            ref
                .read(searchPagingStateNotifierProvider.notifier)
                .searchRepositories(query: value, page: 1);
          }),
        );
      },
    );
  }

  Widget _buildMainWidget(
      {required ValueChanged<String> onFieldSubmitted, Widget? child}) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _textEditingController,
            onFieldSubmitted: (value) {
              onFieldSubmitted(value);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'search keyword repo name',
            ),
          ),
          if (child != null) child,
        ],
      ),
    ));
  }

  Widget _buildListView({
    required List<RepositorySummary> repositories,
    required Function(RepositorySummary repository) onTap,
    required int? nextPageNo,
    required UiState uiState,
  }) {
    return repositories.isEmpty
        ? Container()
        : NotificationListener<ScrollNotification>(
            child: Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: repositories.length,
                  itemBuilder: (BuildContext context, int index) {
                    final repository = repositories[index];
                    return Card(
                      child: InkWell(
                          onTap: () => onTap(repository),
                          child: ListTile(
                            leading: Text('$index'),
                            title: Text(repository.ownerName),
                            subtitle: Text(repository.name),
                            contentPadding: const EdgeInsets.all(8),
                          )),
                    );
                  }),
            ),
            onNotification: (notification) {
              if (notification is OverscrollNotification) {
                if (uiState is Loading) {
                } else {
                  Logger().d('ando is not Loading');
                  if (notification.overscroll > 0 && nextPageNo != null) {
                    // 下端のオーバースクロール && 次ページがある場合
                    //  検索APIを叩く.
                    Logger().d('ando 検索APIを叩く. $nextPageNo');
                    ref
                        .read(searchPagingStateNotifierProvider.notifier)
                        .searchRepositories(
                            query: _textEditingController.text,
                            page: nextPageNo);
                  }
                }
              }
              return false;
            },
          );
  }
}
