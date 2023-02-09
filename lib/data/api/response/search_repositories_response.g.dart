// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repositories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchRepositoriesResponse _$$_SearchRepositoriesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SearchRepositoriesResponse(
      totalCount: json['totalCount'] as int,
      incompleteResults: json['incompleteResults'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) => RepositorySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchRepositoriesResponseToJson(
        _$_SearchRepositoriesResponse instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'incompleteResults': instance.incompleteResults,
      'items': instance.items,
    };
