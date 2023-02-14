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
  const factory UiState.initial(
      {required List<RepositorySummary> repositories,
      required bool isLastPage,
      @Default(1) int nextPageNo}) = Initial;
  const factory UiState.loading(
      {required List<RepositorySummary> repositories,
      required bool isLastPage,
      required int? nextPageNo}) = Loading;
  const factory UiState.data(
      {required List<RepositorySummary> repositories,
      required bool isLastPage,
      required int? nextPageNo}) = Data;
  const factory UiState.error(
      {required List<RepositorySummary> repositories,
      required bool isLastPage,
      required int? nextPageNo,
      required ApplicationException exception}) = Error;
}
