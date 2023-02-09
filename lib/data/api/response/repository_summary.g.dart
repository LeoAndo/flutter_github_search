// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepositorySummary _$$_RepositorySummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_RepositorySummary',
      json,
      ($checkedConvert) {
        final val = _$_RepositorySummary(
          name: $checkedConvert('name', (v) => v as String),
          owner: $checkedConvert(
              'owner', (v) => Owner.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_RepositorySummaryToJson(
        _$_RepositorySummary instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
    };
