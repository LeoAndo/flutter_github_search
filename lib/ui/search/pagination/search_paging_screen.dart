// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'package:flutter_github_search/domain/model/repository_summary.dart';
import 'package:flutter_github_search/ui/detail/detail_screen.dart';
import 'package:flutter_github_search/ui/search/pagination/search_paging_notifier.dart';
import 'package:flutter_github_search/ui/search/pagination/ui_state.dart';

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
                .searchRepositories(query: value, refresh: true);
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
              .searchRepositories(query: value, refresh: true);
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
                .searchRepositories(query: value, refresh: true);
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
              // WORKAROUND!
              // ios/macosで動作 - START
              // ios/macosだとOverscrollNotificationが呼ばれないので、notification.metrics.outOfRangeを使用
              final outOfRange = notification.metrics.outOfRange;
              final extentAfter = notification.metrics.extentAfter;
              final extentBefore = notification.metrics.extentBefore;
              Logger().d('ando outOfRange $outOfRange');
              Logger().d('ando extentAfter $extentAfter');
              Logger().d('ando extentBefore $extentBefore');
              if (outOfRange == true && extentAfter <= 0) {
                Logger().d('ando 下端のオーバースクロールの場合');
                if (uiState is Loading) {
                } else {
                  if (uiState.nextPageNo != null) {
                    // 次ページがある場合のみ検索APIを叩く.
                    Logger().d('ando nextPageNo: ${uiState.nextPageNo}');
                    ref
                        .read(searchPagingStateNotifierProvider.notifier)
                        .searchRepositories(
                            query: _textEditingController.text,
                            page: uiState.nextPageNo ?? 1);
                  }
                }
              } else if (outOfRange == true && extentBefore <= 0) {
                Logger().d('ando 上端のオーバースクロールの場合');
              }
              // ios/macosで動作 - END
              // Androidで動作 - START
              if (notification is OverscrollNotification) {
                if (uiState is Loading) {
                } else {
                  if (notification.overscroll > 0 &&
                      uiState.nextPageNo != null) {
                    // 下端のオーバースクロール && 次ページがある場合のみ検索APIを叩く.
                    Logger().d('ando nextPageNo: ${uiState.nextPageNo}');
                    ref
                        .read(searchPagingStateNotifierProvider.notifier)
                        .searchRepositories(
                            query: _textEditingController.text,
                            page: uiState.nextPageNo ?? 1);
                  }
                }
              }
              // Androidで動作 - END
              return false;
            },
          );
  }
}
