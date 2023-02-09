// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepositorySummary _$$_RepositorySummaryFromJson(Map<String, dynamic> json) =>
    _$_RepositorySummary(
      name: json['name'] as String,
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RepositorySummaryToJson(
        _$_RepositorySummary instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
    };
