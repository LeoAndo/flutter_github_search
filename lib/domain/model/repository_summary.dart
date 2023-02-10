// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_summary.freezed.dart';

@freezed
class RepositorySummary with _$RepositorySummary {
  const factory RepositorySummary({
    required int id,
    required String name,
    required String ownerName,
  }) = _RepositorySummary;
}
