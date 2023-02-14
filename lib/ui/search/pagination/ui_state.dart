// Flutter imports:
import 'package:flutter/foundation.dart';
import '../../../domain/exception/application_exception.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:flutter_github_search/domain/model/repository_summary.dart';

part 'ui_state.freezed.dart';

/// nextPageNoがNullの場合は、次ページなしの運用。
@freezed
class UiState with _$UiState {
  const factory UiState.initial() = Initial;
  const factory UiState.loading() = Loading;
  const factory UiState.data(
      {required List<RepositorySummary> repositories,
      required bool isLastPage,
      int? nextPageNo}) = Data;
  const factory UiState.error(ApplicationException exception) = Error;
}
