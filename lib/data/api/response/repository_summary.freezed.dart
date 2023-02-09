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

RepositorySummary _$RepositorySummaryFromJson(Map<String, dynamic> json) {
  return _RepositorySummary.fromJson(json);
}

/// @nodoc
mixin _$RepositorySummary {
  String get name => throw _privateConstructorUsedError;
  Owner get owner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
  $Res call({String name, Owner owner});

  $OwnerCopyWith<$Res> get owner;
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
    Object? name = null,
    Object? owner = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<$Res> get owner {
    return $OwnerCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
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
  $Res call({String name, Owner owner});

  @override
  $OwnerCopyWith<$Res> get owner;
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
    Object? name = null,
    Object? owner = null,
  }) {
    return _then(_$_RepositorySummary(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RepositorySummary
    with DiagnosticableTreeMixin
    implements _RepositorySummary {
  const _$_RepositorySummary({required this.name, required this.owner});

  factory _$_RepositorySummary.fromJson(Map<String, dynamic> json) =>
      _$$_RepositorySummaryFromJson(json);

  @override
  final String name;
  @override
  final Owner owner;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RepositorySummary(name: $name, owner: $owner)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RepositorySummary'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('owner', owner));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepositorySummary &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, owner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepositorySummaryCopyWith<_$_RepositorySummary> get copyWith =>
      __$$_RepositorySummaryCopyWithImpl<_$_RepositorySummary>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepositorySummaryToJson(
      this,
    );
  }
}

abstract class _RepositorySummary implements RepositorySummary {
  const factory _RepositorySummary(
      {required final String name,
      required final Owner owner}) = _$_RepositorySummary;

  factory _RepositorySummary.fromJson(Map<String, dynamic> json) =
      _$_RepositorySummary.fromJson;

  @override
  String get name;
  @override
  Owner get owner;
  @override
  @JsonKey(ignore: true)
  _$$_RepositorySummaryCopyWith<_$_RepositorySummary> get copyWith =>
      throw _privateConstructorUsedError;
}
