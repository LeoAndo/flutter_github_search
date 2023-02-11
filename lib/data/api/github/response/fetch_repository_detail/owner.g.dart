// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Owner _$$_OwnerFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Owner',
      json,
      ($checkedConvert) {
        final val = _$_Owner(
          avatarUrl: $checkedConvert('avatar_url', (v) => v as String),
          id: $checkedConvert('id', (v) => v as int),
          nodeId: $checkedConvert('node_id', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'avatarUrl': 'avatar_url', 'nodeId': 'node_id'},
    );

Map<String, dynamic> _$$_OwnerToJson(_$_Owner instance) => <String, dynamic>{
      'avatar_url': instance.avatarUrl,
      'id': instance.id,
      'node_id': instance.nodeId,
    };
