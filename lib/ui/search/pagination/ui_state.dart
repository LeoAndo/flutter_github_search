// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:flutter_github_search/domain/model/repository_summary.dart';
import '../../../domain/exception/application_exception.dart';

part 'ui_state.freezed.dart';

/// nextPageNoがNullの場合は、次ページなしの運用。
@freezed
class UiState with _$UiState {
  const factory UiState.initial(
      {@Default([]) List<RepositorySummary> repositories,
      @Default(1) int nextPageNo}) = Initial;
  const factory UiState.loading(
      {required List<RepositorySummary> repositories,
      required int? nextPageNo}) = Loading;
  const factory UiState.data(
      {required List<RepositorySummary> repositories,
      required int? nextPageNo}) = Data;
  const factory UiState.error(
      {required List<RepositorySummary> repositories,
      required int? nextPageNo,
      required ApplicationException exception}) = Error;
}
