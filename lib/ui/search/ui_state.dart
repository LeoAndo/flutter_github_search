// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:flutter_github_search/domain/model/repository_summary.dart';
import '../../../domain/exception/application_exception.dart';

part 'ui_state.freezed.dart';

@freezed
class UiState with _$UiState {
  const factory UiState.initial() = Initial;
  const factory UiState.loading() = Loading;
  const factory UiState.data(List<RepositorySummary> repositories) = Data;
  const factory UiState.error(ApplicationException apiException) = Error;
}
