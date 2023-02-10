// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repositories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchRepositoriesResponse _$$_SearchRepositoriesResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SearchRepositoriesResponse',
      json,
      ($checkedConvert) {
        final val = _$_SearchRepositoriesResponse(
          totalCount: $checkedConvert('total_count', (v) => v as int),
          incompleteResults:
              $checkedConvert('incomplete_results', (v) => v as bool),
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) => Item.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'totalCount': 'total_count',
        'incompleteResults': 'incomplete_results'
      },
    );

Map<String, dynamic> _$$_SearchRepositoriesResponseToJson(
        _$_SearchRepositoriesResponse instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };
