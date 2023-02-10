// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../../../../domain/model/repository_summary.dart';
import 'item.dart';

part 'search_repositories_response.freezed.dart';
part 'search_repositories_response.g.dart';

@freezed
class SearchRepositoriesResponse with _$SearchRepositoriesResponse {
  const factory SearchRepositoriesResponse({
    required int totalCount,
    required bool incompleteResults,
    required List<Item> items,
  }) = _SearchRepositoriesResponse;
  factory SearchRepositoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoriesResponseFromJson(json);
}

extension SearchRepositoriesResponseExt on SearchRepositoriesResponse {
  List<RepositorySummary> toModels() {
    return items
        .map((data) => RepositorySummary(
            id: data.id, name: data.name, ownerName: data.owner.login))
        .toList();
  }
}
