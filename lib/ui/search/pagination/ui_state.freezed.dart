// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UiState {
  List<RepositorySummary> get repositories =>
      throw _privateConstructorUsedError;
  int? get nextPageNo => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<RepositorySummary> repositories, int nextPageNo)
        initial,
    required TResult Function(
            List<RepositorySummary> repositories, int? nextPageNo)
        loading,
    required TResult Function(
            List<RepositorySummary> repositories, int? nextPageNo)
        data,
    required TResult Function(List<RepositorySummary> repositories,
            int? nextPageNo, ApplicationException exception)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<RepositorySummary> repositories, int nextPageNo)?
        initial,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo)?
        loading,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo)?
        data,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo,
            ApplicationException exception)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<RepositorySummary> repositories, int nextPageNo)?
        initial,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo)?
        loading,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo)?
        data,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo,
            ApplicationException exception)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Data value) data,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Data value)? data,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Data value)? data,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UiStateCopyWith<UiState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiStateCopyWith<$Res> {
  factory $UiStateCopyWith(UiState value, $Res Function(UiState) then) =
      _$UiStateCopyWithImpl<$Res, UiState>;
  @useResult
  $Res call({List<RepositorySummary> repositories, int nextPageNo});
}

/// @nodoc
class _$UiStateCopyWithImpl<$Res, $Val extends UiState>
    implements $UiStateCopyWith<$Res> {
  _$UiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repositories = null,
    Object? nextPageNo = null,
  }) {
    return _then(_value.copyWith(
      repositories: null == repositories
          ? _value.repositories
          : repositories // ignore: cast_nullable_to_non_nullable
              as List<RepositorySummary>,
      nextPageNo: null == nextPageNo
          ? _value.nextPageNo!
          : nextPageNo // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> implements $UiStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RepositorySummary> repositories, int nextPageNo});
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$UiStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repositories = null,
    Object? nextPageNo = null,
  }) {
    return _then(_$Initial(
      repositories: null == repositories
          ? _value._repositories
          : repositories // ignore: cast_nullable_to_non_nullable
              as List<RepositorySummary>,
      nextPageNo: null == nextPageNo
          ? _value.nextPageNo
          : nextPageNo // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Initial with DiagnosticableTreeMixin implements Initial {
  const _$Initial(
      {final List<RepositorySummary> repositories = const [],
      this.nextPageNo = 1})
      : _repositories = repositories;

  final List<RepositorySummary> _repositories;
  @override
  @JsonKey()
  List<RepositorySummary> get repositories {
    if (_repositories is EqualUnmodifiableListView) return _repositories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_repositories);
  }

  @override
  @JsonKey()
  final int nextPageNo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UiState.initial(repositories: $repositories, nextPageNo: $nextPageNo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UiState.initial'))
      ..add(DiagnosticsProperty('repositories', repositories))
      ..add(DiagnosticsProperty('nextPageNo', nextPageNo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initial &&
            const DeepCollectionEquality()
                .equals(other._repositories, _repositories) &&
            (identical(other.nextPageNo, nextPageNo) ||
                other.nextPageNo == nextPageNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_repositories), nextPageNo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<RepositorySummary> repositories, int nextPageNo)
        initial,
    required TResult Function(
            List<RepositorySummary> repositories, int? nextPageNo)
        loading,
    required TResult Function(
            List<RepositorySummary> repositories, int? nextPageNo)
        data,
    required TResult Function(List<RepositorySummary> repositories,
            int? nextPageNo, ApplicationException exception)
        error,
  }) {
    return initial(repositories, nextPageNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<RepositorySummary> repositories, int nextPageNo)?
        initial,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo)?
        loading,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo)?
        data,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo,
            ApplicationException exception)?
        error,
  }) {
    return initial?.call(repositories, nextPageNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<RepositorySummary> repositories, int nextPageNo)?
        initial,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo)?
        loading,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo)?
        data,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo,
            ApplicationException exception)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(repositories, nextPageNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Data value) data,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Data value)? data,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Data value)? data,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements UiState {
  const factory Initial(
      {final List<RepositorySummary> repositories,
      final int nextPageNo}) = _$Initial;

  @override
  List<RepositorySummary> get repositories;
  @override
  int get nextPageNo;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> implements $UiStateCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RepositorySummary> repositories, int? nextPageNo});
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$UiStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repositories = null,
    Object? nextPageNo = freezed,
  }) {
    return _then(_$Loading(
      repositories: null == repositories
          ? _value._repositories
          : repositories // ignore: cast_nullable_to_non_nullable
              as List<RepositorySummary>,
      nextPageNo: freezed == nextPageNo
          ? _value.nextPageNo
          : nextPageNo // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$Loading with DiagnosticableTreeMixin implements Loading {
  const _$Loading(
      {required final List<RepositorySummary> repositories,
      required this.nextPageNo})
      : _repositories = repositories;

  final List<RepositorySummary> _repositories;
  @override
  List<RepositorySummary> get repositories {
    if (_repositories is EqualUnmodifiableListView) return _repositories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_repositories);
  }

  @override
  final int? nextPageNo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UiState.loading(repositories: $repositories, nextPageNo: $nextPageNo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UiState.loading'))
      ..add(DiagnosticsProperty('repositories', repositories))
      ..add(DiagnosticsProperty('nextPageNo', nextPageNo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loading &&
            const DeepCollectionEquality()
                .equals(other._repositories, _repositories) &&
            (identical(other.nextPageNo, nextPageNo) ||
                other.nextPageNo == nextPageNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_repositories), nextPageNo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingCopyWith<_$Loading> get copyWith =>
      __$$LoadingCopyWithImpl<_$Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<RepositorySummary> repositories, int nextPageNo)
        initial,
    required TResult Function(
            List<RepositorySummary> repositories, int? nextPageNo)
        loading,
    required TResult Function(
            List<RepositorySummary> repositories, int? nextPageNo)
        data,
    required TResult Function(List<RepositorySummary> repositories,
            int? nextPageNo, ApplicationException exception)
        error,
  }) {
    return loading(repositories, nextPageNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<RepositorySummary> repositories, int nextPageNo)?
        initial,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo)?
        loading,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo)?
        data,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo,
            ApplicationException exception)?
        error,
  }) {
    return loading?.call(repositories, nextPageNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<RepositorySummary> repositories, int nextPageNo)?
        initial,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo)?
        loading,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo)?
        data,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo,
            ApplicationException exception)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(repositories, nextPageNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Data value) data,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Data value)? data,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Data value)? data,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements UiState {
  const factory Loading(
      {required final List<RepositorySummary> repositories,
      required final int? nextPageNo}) = _$Loading;

  @override
  List<RepositorySummary> get repositories;
  @override
  int? get nextPageNo;
  @override
  @JsonKey(ignore: true)
  _$$LoadingCopyWith<_$Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DataCopyWith<$Res> implements $UiStateCopyWith<$Res> {
  factory _$$DataCopyWith(_$Data value, $Res Function(_$Data) then) =
      __$$DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RepositorySummary> repositories, int? nextPageNo});
}

/// @nodoc
class __$$DataCopyWithImpl<$Res> extends _$UiStateCopyWithImpl<$Res, _$Data>
    implements _$$DataCopyWith<$Res> {
  __$$DataCopyWithImpl(_$Data _value, $Res Function(_$Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repositories = null,
    Object? nextPageNo = freezed,
  }) {
    return _then(_$Data(
      repositories: null == repositories
          ? _value._repositories
          : repositories // ignore: cast_nullable_to_non_nullable
              as List<RepositorySummary>,
      nextPageNo: freezed == nextPageNo
          ? _value.nextPageNo
          : nextPageNo // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$Data with DiagnosticableTreeMixin implements Data {
  const _$Data(
      {required final List<RepositorySummary> repositories,
      required this.nextPageNo})
      : _repositories = repositories;

  final List<RepositorySummary> _repositories;
  @override
  List<RepositorySummary> get repositories {
    if (_repositories is EqualUnmodifiableListView) return _repositories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_repositories);
  }

  @override
  final int? nextPageNo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UiState.data(repositories: $repositories, nextPageNo: $nextPageNo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UiState.data'))
      ..add(DiagnosticsProperty('repositories', repositories))
      ..add(DiagnosticsProperty('nextPageNo', nextPageNo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Data &&
            const DeepCollectionEquality()
                .equals(other._repositories, _repositories) &&
            (identical(other.nextPageNo, nextPageNo) ||
                other.nextPageNo == nextPageNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_repositories), nextPageNo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataCopyWith<_$Data> get copyWith =>
      __$$DataCopyWithImpl<_$Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<RepositorySummary> repositories, int nextPageNo)
        initial,
    required TResult Function(
            List<RepositorySummary> repositories, int? nextPageNo)
        loading,
    required TResult Function(
            List<RepositorySummary> repositories, int? nextPageNo)
        data,
    required TResult Function(List<RepositorySummary> repositories,
            int? nextPageNo, ApplicationException exception)
        error,
  }) {
    return data(repositories, nextPageNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<RepositorySummary> repositories, int nextPageNo)?
        initial,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo)?
        loading,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo)?
        data,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo,
            ApplicationException exception)?
        error,
  }) {
    return data?.call(repositories, nextPageNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<RepositorySummary> repositories, int nextPageNo)?
        initial,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo)?
        loading,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo)?
        data,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo,
            ApplicationException exception)?
        error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(repositories, nextPageNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Data value) data,
    required TResult Function(Error value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Data value)? data,
    TResult? Function(Error value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Data value)? data,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Data implements UiState {
  const factory Data(
      {required final List<RepositorySummary> repositories,
      required final int? nextPageNo}) = _$Data;

  @override
  List<RepositorySummary> get repositories;
  @override
  int? get nextPageNo;
  @override
  @JsonKey(ignore: true)
  _$$DataCopyWith<_$Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> implements $UiStateCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<RepositorySummary> repositories,
      int? nextPageNo,
      ApplicationException exception});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res> extends _$UiStateCopyWithImpl<$Res, _$Error>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repositories = null,
    Object? nextPageNo = freezed,
    Object? exception = null,
  }) {
    return _then(_$Error(
      repositories: null == repositories
          ? _value._repositories
          : repositories // ignore: cast_nullable_to_non_nullable
              as List<RepositorySummary>,
      nextPageNo: freezed == nextPageNo
          ? _value.nextPageNo
          : nextPageNo // ignore: cast_nullable_to_non_nullable
              as int?,
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as ApplicationException,
    ));
  }
}

/// @nodoc

class _$Error with DiagnosticableTreeMixin implements Error {
  const _$Error(
      {required final List<RepositorySummary> repositories,
      required this.nextPageNo,
      required this.exception})
      : _repositories = repositories;

  final List<RepositorySummary> _repositories;
  @override
  List<RepositorySummary> get repositories {
    if (_repositories is EqualUnmodifiableListView) return _repositories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_repositories);
  }

  @override
  final int? nextPageNo;
  @override
  final ApplicationException exception;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UiState.error(repositories: $repositories, nextPageNo: $nextPageNo, exception: $exception)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UiState.error'))
      ..add(DiagnosticsProperty('repositories', repositories))
      ..add(DiagnosticsProperty('nextPageNo', nextPageNo))
      ..add(DiagnosticsProperty('exception', exception));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            const DeepCollectionEquality()
                .equals(other._repositories, _repositories) &&
            (identical(other.nextPageNo, nextPageNo) ||
                other.nextPageNo == nextPageNo) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_repositories),
      nextPageNo,
      exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<RepositorySummary> repositories, int nextPageNo)
        initial,
    required TResult Function(
            List<RepositorySummary> repositories, int? nextPageNo)
        loading,
    required TResult Function(
            List<RepositorySummary> repositories, int? nextPageNo)
        data,
    required TResult Function(List<RepositorySummary> repositories,
            int? nextPageNo, ApplicationException exception)
        error,
  }) {
    return error(repositories, nextPageNo, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<RepositorySummary> repositories, int nextPageNo)?
        initial,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo)?
        loading,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo)?
        data,
    TResult? Function(List<RepositorySummary> repositories, int? nextPageNo,
            ApplicationException exception)?
        error,
  }) {
    return error?.call(repositories, nextPageNo, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<RepositorySummary> repositories, int nextPageNo)?
        initial,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo)?
        loading,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo)?
        data,
    TResult Function(List<RepositorySummary> repositories, int? nextPageNo,
            ApplicationException exception)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(repositories, nextPageNo, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Data value) data,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Data value)? data,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Data value)? data,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements UiState {
  const factory Error(
      {required final List<RepositorySummary> repositories,
      required final int? nextPageNo,
      required final ApplicationException exception}) = _$Error;

  @override
  List<RepositorySummary> get repositories;
  @override
  int? get nextPageNo;
  ApplicationException get exception;
  @override
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}
