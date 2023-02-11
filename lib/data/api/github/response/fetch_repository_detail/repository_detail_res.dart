// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:flutter_github_search/domain/model/repository_detail.dart';
import 'owner.dart';

// 🌎 Project imports:

part 'repository_detail_res.freezed.dart';
part 'repository_detail_res.g.dart';

@freezed
class RepositoryDetailRes with _$RepositoryDetailRes {
  const factory RepositoryDetailRes({
    required int forksCount,
    required int id,
    required String name,
    required int openIssuesCount,
    required Owner owner,
    required int stargazersCount,
    required int watchersCount,
    String? language,
    String? description,
  }) = _RepositoryDetailRes;

  factory RepositoryDetailRes.fromJson(Map<String, dynamic> json) =>
      _$RepositoryDetailResFromJson(json);
}

extension RepositoryDetailResExt on RepositoryDetailRes {
  RepositoryDetail toModel() {
    return RepositoryDetail(
      name: name,
      ownerAvatarUrl: owner.avatarUrl,
      stargazersCount: stargazersCount,
      forksCount: forksCount,
      openIssuesCount: openIssuesCount,
      watchersCount: watchersCount,
      language: language,
      description: description,
    );
  }
}
