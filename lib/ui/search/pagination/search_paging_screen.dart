import 'package:flutter/material.dart';
import 'package:flutter_github_search/domain/model/repository_summary.dart';
import 'package:flutter_github_search/ui/components/app_error.dart';
import 'package:flutter_github_search/ui/components/app_loading.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';

import '../../../data/api/github/github_api_http_client.dart';
import '../../../data/api/github/response/search_repositories/search_repositories_response.dart';
import 'dart:convert' as convert;

import '../../../domain/exception/api_exceptions.dart';
import '../../detail/detail_screen.dart';

class RemoteApi {
  static const _authority = 'api.github.com';
  final client = GithubApiHttpClient();
  Future<List<RepositorySummary>> searchRepositories(
      {required String query,
      required int page,
      int perPage = 20,
      String sort = "stars"}) async {
    final queryParameters = <String, String>{
      'q': query,
      'page': page.toString(),
      'per_page': perPage.toString(),
      'sort': sort,
    };
    final response = await client
        .get(Uri.https(_authority, '/search/repositories', queryParameters));
    final json = convert.jsonDecode(response.body) as Map<String, dynamic>;
    return SearchRepositoriesResponse.fromJson(json).toModels();
  }
}

class SearchPagingScreen extends StatefulWidget {
  const SearchPagingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPagingScreenState();
}

class _SearchPagingScreenState extends State<SearchPagingScreen> {
  static const _pageSize = 20;
  bool _isBuildListView = false;
  final TextEditingController _textEditingController = TextEditingController();

  final PagingController<int, RepositorySummary> _pagingController =
      PagingController(firstPageKey: 1);

  Future<void> searchRepositories(
      {required String query, required int page}) async {
    try {
      final newItems = await RemoteApi().searchRepositories(
          query: query, page: page); // no more : AndroidGithub
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        page++;
        _pagingController.appendPage(newItems, page);
      }
    } on ApiException catch (error) {
      Logger().d('ando ${error.toString()}');
      _pagingController.error = error;
    }
  }

  @override
  void initState() {
    Logger().d('ando _SearchPagingScreenState call initState');
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      Logger().d(
          'ando addPageRequestListener pageKey: $pageKey, firstPageKey: ${_pagingController.firstPageKey} , nextPageKey: ${_pagingController.value.nextPageKey}, status: ${_pagingController.value.status}');
      searchRepositories(query: _textEditingController.text, page: pageKey);
    });
    _pagingController.addStatusListener((status) {
      // Exceptionを受け取れない....
      Logger().d(
          'ando addStatusListener firstPageKey: ${_pagingController.firstPageKey} , nextPageKey: ${_pagingController.value.nextPageKey}, status: ${_pagingController.value.status}');
      if (status == PagingStatus.subsequentPageError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Something went wrong while fetching a new page.',
            ),
            duration: const Duration(seconds: 5),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () => _pagingController.retryLastFailedRequest(),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Logger().d('ando build $_isBuildListView');
    return Scaffold(
      body: _buildMainWidget(
        child: _isBuildListView
            ? _buildListView(onTap: (repository) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(
                      ownerName: repository.ownerName,
                      repositoryName: repository.name,
                    ),
                  ),
                );
              })
            : Container(),
        onFieldSubmitted: (value) {
          setState(() => _isBuildListView = true);
        },
      ),
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

  Widget _buildListView(
      {required Function(RepositorySummary repository) onTap}) {
    Logger().d('ando call _buildListView');
    return Expanded(
        child: PagedListView<int, RepositorySummary>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<RepositorySummary>(
        itemBuilder: (context, repository, index) {
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
        },
        firstPageErrorIndicatorBuilder: (_) {
          Logger().d('ando call firstPageErrorIndicatorBuilder');
          return AppError(
              message: _pagingController.error.toString(),
              onReload: () => _pagingController.refresh());
        },
        newPageErrorIndicatorBuilder: (_) {
          Logger().d('ando call newPageErrorIndicatorBuilder');
          return ElevatedButton(
              onPressed: () => _pagingController.retryLastFailedRequest(),
              child: const Text('reload'));
        },
        firstPageProgressIndicatorBuilder: (_) {
          Logger().d('ando call firstPageProgressIndicatorBuilder');
          return const AppLoading();
        },
        newPageProgressIndicatorBuilder: (_) {
          Logger().d('ando call newPageProgressIndicatorBuilder');
          return const AppLoading();
        },
        noItemsFoundIndicatorBuilder: (_) {
          Logger().d('ando call noItemsFoundIndicatorBuilder');
          return Stack(
            children: const [
              Center(child: Text('Items Not Found')),
            ],
          );
        },
        noMoreItemsIndicatorBuilder: (_) {
          Logger().d('ando call noMoreItemsIndicatorBuilder');
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('no more items'),
            ),
          );
        },
      ),
    ));
  }

  @override
  void dispose() {
    Logger().d('ando _SearchPagingScreenState call dispose');
    super.dispose();
    _pagingController.dispose();
    _textEditingController.dispose();
  }
}
