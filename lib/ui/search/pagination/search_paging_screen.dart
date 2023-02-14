// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_github_search/ui/search/pagination/search_paging_notifier.dart';
import 'package:flutter_github_search/ui/search/pagination/ui_state.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'package:flutter_github_search/domain/model/repository_summary.dart';
import 'package:flutter_github_search/ui/detail/detail_screen.dart';

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
        body: _buildBody());
  }

  Widget _buildBody() {
    final uiState = ref.watch(searchPagingStateNotifierProvider);
    return uiState.when(
      loading: (repositories, isLastPage, nextPageNo) {
        return _buildMainWidget(
            child: _buildListView(
              uiState: uiState,
              onTap: (repository) {},
            ),
            onFieldSubmitted: (String value) {});
      },
      initial: (repositories, isLastPage, nextPageNo) => _buildMainWidget(
          child: _buildListView(
            uiState: uiState,
            onTap: (_) {},
          ),
          onFieldSubmitted: (String value) {
            ref
                .read(searchPagingStateNotifierProvider.notifier)
                .searchRepositories(
                    query: value, page: nextPageNo, refresh: true);
          }),
      data: (repositories, isLastPage, nextPageNo) => _buildMainWidget(
          child: _buildListView(
            uiState: uiState,
            onTap: (repository) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(
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
                .searchRepositories(
                    query: value, page: nextPageNo ?? 1, refresh: true);
          }),
      error: (repositories, isLastPage, nextPageNo, e) {
        return _buildMainWidget(
            child: _buildListView(
              uiState: uiState,
              onTap: (repository) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(
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
                  .searchRepositories(
                      query: value, page: nextPageNo ?? 1, refresh: true);
            });
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
    required Function(RepositorySummary repository) onTap,
    required UiState uiState,
  }) {
    return uiState.repositories.isEmpty
        ? Container()
        : NotificationListener<ScrollNotification>(
            child: Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: uiState.repositories.length,
                  itemBuilder: (BuildContext context, int index) {
                    final repository = uiState.repositories[index];
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
                  Logger().d(
                      'ando is not Loading nextPageNo: ${uiState.nextPageNo}');
                  if (notification.overscroll > 0 &&
                      uiState.nextPageNo != null) {
                    // 下端のオーバースクロール && 次ページがある場合
                    //  検索APIを叩く.
                    Logger().d('ando 次ページを取得する. ${uiState.nextPageNo}');
                    ref
                        .read(searchPagingStateNotifierProvider.notifier)
                        .searchRepositories(
                            query: _textEditingController.text,
                            page: uiState.nextPageNo ?? 1);
                  }
                }
              }
              return false;
            },
          );
  }
}
