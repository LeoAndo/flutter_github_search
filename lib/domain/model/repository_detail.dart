// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_detail.freezed.dart';

@freezed
class RepositoryDetail with _$RepositoryDetail {
  const factory RepositoryDetail({
    required String name,
    required String ownerAvatarUrl,
    required int stargazersCount,
    required int forksCount,
    required int openIssuesCount,
    required int watchersCount,
    String? language,
    String? description,
  }) = _RepositoryDetail;
}
