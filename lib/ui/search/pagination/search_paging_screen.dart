// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_github_search/ui/search/pagination/search_paging_notifier.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'package:flutter_github_search/domain/model/repository_summary.dart';
import 'package:flutter_github_search/ui/detail/detail_screen.dart';
import '../../../domain/exception/api_exceptions.dart';
import '../../components/app_error.dart';

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
      // loading: () {
      //   return AppLoading(
      //     mainWidget: _buildMainWidget(
      //       onFieldSubmitted: (_) {},
      //     ),
      //   );
      // },
      initial: () => _buildMainWidget(
          child: _buildListView(
            repositories: [],
            onTap: (_) {},
          ),
          onFieldSubmitted: (String value) {
            ref
                .read(searchPagingStateNotifierProvider.notifier)
                .searchRepositories(query: value, page: 1);
          }),
      data: (repositories, isFinish, page) => _buildMainWidget(
          child: _buildListView(
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
      error: (ApiException e) {
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
                            title: Text(repository.ownerName),
                            subtitle: Text(repository.name),
                            contentPadding: const EdgeInsets.all(8),
                          )),
                    );
                  }),
            ),
            onNotification: (notification) {
              // print(notification);
              if (notification is OverscrollNotification) {
                if (notification.overscroll > 0) {}
                Logger().d('overscroll: ${notification.overscroll}');
              }
              return false;
            },
          );
  }
}
