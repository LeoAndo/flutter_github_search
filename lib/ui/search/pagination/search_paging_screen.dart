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
      loading: (_, nextPageNo) {
        return _buildMainWidget(
          child: _buildListView(
            uiState: uiState,
            onTap: (_) {},
          ),
          onFieldSubmitted: (_) {},
          uiState: uiState,
        );
      },
      initial: (_, nextPageNo) => _buildMainWidget(
          child: _buildListView(
            uiState: uiState,
            onTap: (_) {},
          ),
          onFieldSubmitted: (String value) {
            ref
                .read(searchPagingStateNotifierProvider.notifier)
                .searchRepositories(
                    query: value, page: nextPageNo, refresh: true);
          },
          uiState: uiState),
      data: (_, nextPageNo) => _buildMainWidget(
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
        },
        uiState: uiState,
      ),
      error: (_, nextPageNo, e) {
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
            errorMessage: e.message,
          ),
          onFieldSubmitted: (String value) {
            ref
                .read(searchPagingStateNotifierProvider.notifier)
                .searchRepositories(
                    query: value, page: nextPageNo ?? 1, refresh: true);
          },
          uiState: uiState,
          errorMessage: e.message,
        );
      },
    );
  }

  Widget _buildMainWidget({
    required ValueChanged<String> onFieldSubmitted,
    required UiState uiState,
    Widget? child,
    String? errorMessage,
  }) {
    final message =
        'Please check the communication environment and overscroll again or ReSearch. $errorMessage';
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                Column(
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
                    if (uiState is Error)
                      Text(
                        message,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      )
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (uiState is Loading) const CircularProgressIndicator(),
                    ],
                  ),
                )
              ],
            )));
  }

  Widget _buildListView({
    required Function(RepositorySummary repository) onTap,
    required UiState uiState,
    String? errorMessage,
  }) {
    return uiState.repositories.isEmpty
        ? (uiState is Data)
            ? const Center(
                child: Text('result empty..'),
              )
            : Container()
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
                  if (notification.overscroll > 0 &&
                      uiState.nextPageNo != null) {
                    // 下端のオーバースクロール && 次ページがある場合のみ検索APIを叩く.
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
