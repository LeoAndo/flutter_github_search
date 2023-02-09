// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_repositories_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchRepositoriesResponse _$SearchRepositoriesResponseFromJson(
    Map<String, dynamic> json) {
  return _SearchRepositoriesResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchRepositoriesResponse {
  int get totalCount => throw _privateConstructorUsedError;
  bool get incompleteResults => throw _privateConstructorUsedError;
  List<RepositorySummary> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchRepositoriesResponseCopyWith<SearchRepositoriesResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchRepositoriesResponseCopyWith<$Res> {
  factory $SearchRepositoriesResponseCopyWith(SearchRepositoriesResponse value,
          $Res Function(SearchRepositoriesResponse) then) =
      _$SearchRepositoriesResponseCopyWithImpl<$Res,
          SearchRepositoriesResponse>;
  @useResult
  $Res call(
      {int totalCount, bool incompleteResults, List<RepositorySummary> items});
}

/// @nodoc
class _$SearchRepositoriesResponseCopyWithImpl<$Res,
        $Val extends SearchRepositoriesResponse>
    implements $SearchRepositoriesResponseCopyWith<$Res> {
  _$SearchRepositoriesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? incompleteResults = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      incompleteResults: null == incompleteResults
          ? _value.incompleteResults
          : incompleteResults // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RepositorySummary>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchRepositoriesResponseCopyWith<$Res>
    implements $SearchRepositoriesResponseCopyWith<$Res> {
  factory _$$_SearchRepositoriesResponseCopyWith(
          _$_SearchRepositoriesResponse value,
          $Res Function(_$_SearchRepositoriesResponse) then) =
      __$$_SearchRepositoriesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalCount, bool incompleteResults, List<RepositorySummary> items});
}

/// @nodoc
class __$$_SearchRepositoriesResponseCopyWithImpl<$Res>
    extends _$SearchRepositoriesResponseCopyWithImpl<$Res,
        _$_SearchRepositoriesResponse>
    implements _$$_SearchRepositoriesResponseCopyWith<$Res> {
  __$$_SearchRepositoriesResponseCopyWithImpl(
      _$_SearchRepositoriesResponse _value,
      $Res Function(_$_SearchRepositoriesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? incompleteResults = null,
    Object? items = null,
  }) {
    return _then(_$_SearchRepositoriesResponse(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      incompleteResults: null == incompleteResults
          ? _value.incompleteResults
          : incompleteResults // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RepositorySummary>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchRepositoriesResponse
    with DiagnosticableTreeMixin
    implements _SearchRepositoriesResponse {
  const _$_SearchRepositoriesResponse(
      {required this.totalCount,
      required this.incompleteResults,
      required final List<RepositorySummary> items})
      : _items = items;

  factory _$_SearchRepositoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SearchRepositoriesResponseFromJson(json);

  @override
  final int totalCount;
  @override
  final bool incompleteResults;
  final List<RepositorySummary> _items;
  @override
  List<RepositorySummary> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchRepositoriesResponse(totalCount: $totalCount, incompleteResults: $incompleteResults, items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchRepositoriesResponse'))
      ..add(DiagnosticsProperty('totalCount', totalCount))
      ..add(DiagnosticsProperty('incompleteResults', incompleteResults))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchRepositoriesResponse &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.incompleteResults, incompleteResults) ||
                other.incompleteResults == incompleteResults) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount, incompleteResults,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchRepositoriesResponseCopyWith<_$_SearchRepositoriesResponse>
      get copyWith => __$$_SearchRepositoriesResponseCopyWithImpl<
          _$_SearchRepositoriesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchRepositoriesResponseToJson(
      this,
    );
  }
}

abstract class _SearchRepositoriesResponse
    implements SearchRepositoriesResponse {
  const factory _SearchRepositoriesResponse(
          {required final int totalCount,
          required final bool incompleteResults,
          required final List<RepositorySummary> items}) =
      _$_SearchRepositoriesResponse;

  factory _SearchRepositoriesResponse.fromJson(Map<String, dynamic> json) =
      _$_SearchRepositoriesResponse.fromJson;

  @override
  int get totalCount;
  @override
  bool get incompleteResults;
  @override
  List<RepositorySummary> get items;
  @override
  @JsonKey(ignore: true)
  _$$_SearchRepositoriesResponseCopyWith<_$_SearchRepositoriesResponse>
      get copyWith => throw _privateConstructorUsedError;
}
