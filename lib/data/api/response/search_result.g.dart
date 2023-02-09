// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchResult _$$_SearchResultFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SearchResult',
      json,
      ($checkedConvert) {
        final val = _$_SearchResult(
          totalCount: $checkedConvert('total_count', (v) => v as int),
          incompleteResults:
              $checkedConvert('incomplete_results', (v) => v as bool),
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      RepositorySummary.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'totalCount': 'total_count',
        'incompleteResults': 'incomplete_results'
      },
    );

Map<String, dynamic> _$$_SearchResultToJson(_$_SearchResult instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };
