// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_detail_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepositoryDetailRes _$$_RepositoryDetailResFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_RepositoryDetailRes',
      json,
      ($checkedConvert) {
        final val = _$_RepositoryDetailRes(
          forksCount: $checkedConvert('forks_count', (v) => v as int),
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          openIssuesCount:
              $checkedConvert('open_issues_count', (v) => v as int),
          owner: $checkedConvert(
              'owner', (v) => Owner.fromJson(v as Map<String, dynamic>)),
          stargazersCount: $checkedConvert('stargazers_count', (v) => v as int),
          watchersCount: $checkedConvert('watchers_count', (v) => v as int),
          language: $checkedConvert('language', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'forksCount': 'forks_count',
        'openIssuesCount': 'open_issues_count',
        'stargazersCount': 'stargazers_count',
        'watchersCount': 'watchers_count'
      },
    );

Map<String, dynamic> _$$_RepositoryDetailResToJson(
        _$_RepositoryDetailRes instance) =>
    <String, dynamic>{
      'forks_count': instance.forksCount,
      'id': instance.id,
      'name': instance.name,
      'open_issues_count': instance.openIssuesCount,
      'owner': instance.owner,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'language': instance.language,
      'description': instance.description,
    };
