// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import './repository_summary.dart';

part 'search_repositories_response.freezed.dart';
part 'search_repositories_response.g.dart';

@freezed
class SearchRepositoriesResponse with _$SearchRepositoriesResponse {
  const factory SearchRepositoriesResponse({
    required int totalCount,
    required bool incompleteResults,
    required List<RepositorySummary> items,
  }) = _SearchRepositoriesResponse;
  factory SearchRepositoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoriesResponseFromJson(json);
}
