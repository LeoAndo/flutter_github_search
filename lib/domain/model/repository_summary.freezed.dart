// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RepositorySummary {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get ownerName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepositorySummaryCopyWith<RepositorySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositorySummaryCopyWith<$Res> {
  factory $RepositorySummaryCopyWith(
          RepositorySummary value, $Res Function(RepositorySummary) then) =
      _$RepositorySummaryCopyWithImpl<$Res, RepositorySummary>;
  @useResult
  $Res call({int id, String name, String ownerName});
}

/// @nodoc
class _$RepositorySummaryCopyWithImpl<$Res, $Val extends RepositorySummary>
    implements $RepositorySummaryCopyWith<$Res> {
  _$RepositorySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ownerName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RepositorySummaryCopyWith<$Res>
    implements $RepositorySummaryCopyWith<$Res> {
  factory _$$_RepositorySummaryCopyWith(_$_RepositorySummary value,
          $Res Function(_$_RepositorySummary) then) =
      __$$_RepositorySummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String ownerName});
}

/// @nodoc
class __$$_RepositorySummaryCopyWithImpl<$Res>
    extends _$RepositorySummaryCopyWithImpl<$Res, _$_RepositorySummary>
    implements _$$_RepositorySummaryCopyWith<$Res> {
  __$$_RepositorySummaryCopyWithImpl(
      _$_RepositorySummary _value, $Res Function(_$_RepositorySummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ownerName = null,
  }) {
    return _then(_$_RepositorySummary(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RepositorySummary implements _RepositorySummary {
  const _$_RepositorySummary(
      {required this.id, required this.name, required this.ownerName});

  @override
  final int id;
  @override
  final String name;
  @override
  final String ownerName;

  @override
  String toString() {
    return 'RepositorySummary(id: $id, name: $name, ownerName: $ownerName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepositorySummary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, ownerName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepositorySummaryCopyWith<_$_RepositorySummary> get copyWith =>
      __$$_RepositorySummaryCopyWithImpl<_$_RepositorySummary>(
          this, _$identity);
}

abstract class _RepositorySummary implements RepositorySummary {
  const factory _RepositorySummary(
      {required final int id,
      required final String name,
      required final String ownerName}) = _$_RepositorySummary;

  @override
  int get id;
  @override
  String get name;
  @override
  String get ownerName;
  @override
  @JsonKey(ignore: true)
  _$$_RepositorySummaryCopyWith<_$_RepositorySummary> get copyWith =>
      throw _privateConstructorUsedError;
}
