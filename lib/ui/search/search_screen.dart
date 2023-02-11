// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'package:flutter_github_search/domain/model/repository_summary.dart';
import 'package:flutter_github_search/ui/detail/detail_screen.dart';
import '../../domain/exception/api_exceptions.dart';
import '../components/app_error.dart';
import '../components/app_loading.dart';
import 'search_state_notifier.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Logger().d('ando _SearchScreenState call initState');
  }

  @override
  void dispose() {
    super.dispose();
    Logger().d('ando _SearchScreenState call dispose');
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Screen'),
        ),
        body: _buildBody(ref));
  }

  Widget _buildBody(WidgetRef ref) {
    final uiState = ref.watch(searchStateNotifierProvider);
    return uiState.when(
      loading: () {
        return _buildMainContent(
          child: const AppLoading(),
          onFieldSubmitted: (_) {},
        );
      },
      initial: () => _buildMainContent(
          child: _buildListView(
            repositories: [],
            onTap: (_) {},
          ),
          onFieldSubmitted: (String value) {
            ref
                .read(searchStateNotifierProvider.notifier)
                .searchRepositories(query: value);
          }),
      data: (repositories) => _buildMainContent(
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
                .read(searchStateNotifierProvider.notifier)
                .searchRepositories(query: value);
          }),
      error: (ApiException e) {
        return _buildMainContent(
            child: AppError(
              message: e.message,
              onReload: () {
                ref
                    .read(searchStateNotifierProvider.notifier)
                    .searchRepositories(query: _textEditingController.text);
              },
            ),
            onFieldSubmitted: (String value) {
              ref
                  .read(searchStateNotifierProvider.notifier)
                  .searchRepositories(query: value);
            });
      },
    );
  }

  Widget _buildMainContent(
      {required ValueChanged<String> onFieldSubmitted, required Widget child}) {
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
          child,
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
        : Expanded(
            child: ListView.builder(
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
          );
  }
}
