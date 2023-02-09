// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'repository_summary.dart';

part 'search_result.freezed.dart';
part 'search_result.g.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required int totalCount,
    required bool incompleteResults,
    required List<RepositorySummary> items,
  }) = _SearchResult;
  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}
