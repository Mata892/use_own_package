// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'external_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ExternalStateTearOff {
  const _$ExternalStateTearOff();

  ExternalStateData data(
      {String? nameValue = '',
      String? passValue = '',
      String? tokenValue = '',
      bool? canCheckBiometrics = false,
      List<BiometricType>? availableBiometrics = const [],
      String? authorized = 'Not Authrized',
      bool? isAuthenticating = false}) {
    return ExternalStateData(
      nameValue: nameValue,
      passValue: passValue,
      tokenValue: tokenValue,
      canCheckBiometrics: canCheckBiometrics,
      availableBiometrics: availableBiometrics,
      authorized: authorized,
      isAuthenticating: isAuthenticating,
    );
  }
}

/// @nodoc
const $ExternalState = _$ExternalStateTearOff();

/// @nodoc
mixin _$ExternalState {
  String? get nameValue => throw _privateConstructorUsedError;
  String? get passValue => throw _privateConstructorUsedError;
  String? get tokenValue => throw _privateConstructorUsedError;
  bool? get canCheckBiometrics => throw _privateConstructorUsedError;
  List<BiometricType>? get availableBiometrics =>
      throw _privateConstructorUsedError;
  String? get authorized => throw _privateConstructorUsedError;
  bool? get isAuthenticating => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? nameValue,
            String? passValue,
            String? tokenValue,
            bool? canCheckBiometrics,
            List<BiometricType>? availableBiometrics,
            String? authorized,
            bool? isAuthenticating)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? nameValue,
            String? passValue,
            String? tokenValue,
            bool? canCheckBiometrics,
            List<BiometricType>? availableBiometrics,
            String? authorized,
            bool? isAuthenticating)?
        data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExternalStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExternalStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExternalStateCopyWith<ExternalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExternalStateCopyWith<$Res> {
  factory $ExternalStateCopyWith(
          ExternalState value, $Res Function(ExternalState) then) =
      _$ExternalStateCopyWithImpl<$Res>;
  $Res call(
      {String? nameValue,
      String? passValue,
      String? tokenValue,
      bool? canCheckBiometrics,
      List<BiometricType>? availableBiometrics,
      String? authorized,
      bool? isAuthenticating});
}

/// @nodoc
class _$ExternalStateCopyWithImpl<$Res>
    implements $ExternalStateCopyWith<$Res> {
  _$ExternalStateCopyWithImpl(this._value, this._then);

  final ExternalState _value;
  // ignore: unused_field
  final $Res Function(ExternalState) _then;

  @override
  $Res call({
    Object? nameValue = freezed,
    Object? passValue = freezed,
    Object? tokenValue = freezed,
    Object? canCheckBiometrics = freezed,
    Object? availableBiometrics = freezed,
    Object? authorized = freezed,
    Object? isAuthenticating = freezed,
  }) {
    return _then(_value.copyWith(
      nameValue: nameValue == freezed
          ? _value.nameValue
          : nameValue // ignore: cast_nullable_to_non_nullable
              as String?,
      passValue: passValue == freezed
          ? _value.passValue
          : passValue // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenValue: tokenValue == freezed
          ? _value.tokenValue
          : tokenValue // ignore: cast_nullable_to_non_nullable
              as String?,
      canCheckBiometrics: canCheckBiometrics == freezed
          ? _value.canCheckBiometrics
          : canCheckBiometrics // ignore: cast_nullable_to_non_nullable
              as bool?,
      availableBiometrics: availableBiometrics == freezed
          ? _value.availableBiometrics
          : availableBiometrics // ignore: cast_nullable_to_non_nullable
              as List<BiometricType>?,
      authorized: authorized == freezed
          ? _value.authorized
          : authorized // ignore: cast_nullable_to_non_nullable
              as String?,
      isAuthenticating: isAuthenticating == freezed
          ? _value.isAuthenticating
          : isAuthenticating // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class $ExternalStateDataCopyWith<$Res>
    implements $ExternalStateCopyWith<$Res> {
  factory $ExternalStateDataCopyWith(
          ExternalStateData value, $Res Function(ExternalStateData) then) =
      _$ExternalStateDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? nameValue,
      String? passValue,
      String? tokenValue,
      bool? canCheckBiometrics,
      List<BiometricType>? availableBiometrics,
      String? authorized,
      bool? isAuthenticating});
}

/// @nodoc
class _$ExternalStateDataCopyWithImpl<$Res>
    extends _$ExternalStateCopyWithImpl<$Res>
    implements $ExternalStateDataCopyWith<$Res> {
  _$ExternalStateDataCopyWithImpl(
      ExternalStateData _value, $Res Function(ExternalStateData) _then)
      : super(_value, (v) => _then(v as ExternalStateData));

  @override
  ExternalStateData get _value => super._value as ExternalStateData;

  @override
  $Res call({
    Object? nameValue = freezed,
    Object? passValue = freezed,
    Object? tokenValue = freezed,
    Object? canCheckBiometrics = freezed,
    Object? availableBiometrics = freezed,
    Object? authorized = freezed,
    Object? isAuthenticating = freezed,
  }) {
    return _then(ExternalStateData(
      nameValue: nameValue == freezed
          ? _value.nameValue
          : nameValue // ignore: cast_nullable_to_non_nullable
              as String?,
      passValue: passValue == freezed
          ? _value.passValue
          : passValue // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenValue: tokenValue == freezed
          ? _value.tokenValue
          : tokenValue // ignore: cast_nullable_to_non_nullable
              as String?,
      canCheckBiometrics: canCheckBiometrics == freezed
          ? _value.canCheckBiometrics
          : canCheckBiometrics // ignore: cast_nullable_to_non_nullable
              as bool?,
      availableBiometrics: availableBiometrics == freezed
          ? _value.availableBiometrics
          : availableBiometrics // ignore: cast_nullable_to_non_nullable
              as List<BiometricType>?,
      authorized: authorized == freezed
          ? _value.authorized
          : authorized // ignore: cast_nullable_to_non_nullable
              as String?,
      isAuthenticating: isAuthenticating == freezed
          ? _value.isAuthenticating
          : isAuthenticating // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$ExternalStateData implements ExternalStateData {
  _$ExternalStateData(
      {this.nameValue = '',
      this.passValue = '',
      this.tokenValue = '',
      this.canCheckBiometrics = false,
      this.availableBiometrics = const [],
      this.authorized = 'Not Authrized',
      this.isAuthenticating = false});

  @JsonKey(defaultValue: '')
  @override
  final String? nameValue;
  @JsonKey(defaultValue: '')
  @override
  final String? passValue;
  @JsonKey(defaultValue: '')
  @override
  final String? tokenValue;
  @JsonKey(defaultValue: false)
  @override
  final bool? canCheckBiometrics;
  @JsonKey(defaultValue: const [])
  @override
  final List<BiometricType>? availableBiometrics;
  @JsonKey(defaultValue: 'Not Authrized')
  @override
  final String? authorized;
  @JsonKey(defaultValue: false)
  @override
  final bool? isAuthenticating;

  @override
  String toString() {
    return 'ExternalState.data(nameValue: $nameValue, passValue: $passValue, tokenValue: $tokenValue, canCheckBiometrics: $canCheckBiometrics, availableBiometrics: $availableBiometrics, authorized: $authorized, isAuthenticating: $isAuthenticating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExternalStateData &&
            (identical(other.nameValue, nameValue) ||
                const DeepCollectionEquality()
                    .equals(other.nameValue, nameValue)) &&
            (identical(other.passValue, passValue) ||
                const DeepCollectionEquality()
                    .equals(other.passValue, passValue)) &&
            (identical(other.tokenValue, tokenValue) ||
                const DeepCollectionEquality()
                    .equals(other.tokenValue, tokenValue)) &&
            (identical(other.canCheckBiometrics, canCheckBiometrics) ||
                const DeepCollectionEquality()
                    .equals(other.canCheckBiometrics, canCheckBiometrics)) &&
            (identical(other.availableBiometrics, availableBiometrics) ||
                const DeepCollectionEquality()
                    .equals(other.availableBiometrics, availableBiometrics)) &&
            (identical(other.authorized, authorized) ||
                const DeepCollectionEquality()
                    .equals(other.authorized, authorized)) &&
            (identical(other.isAuthenticating, isAuthenticating) ||
                const DeepCollectionEquality()
                    .equals(other.isAuthenticating, isAuthenticating)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nameValue) ^
      const DeepCollectionEquality().hash(passValue) ^
      const DeepCollectionEquality().hash(tokenValue) ^
      const DeepCollectionEquality().hash(canCheckBiometrics) ^
      const DeepCollectionEquality().hash(availableBiometrics) ^
      const DeepCollectionEquality().hash(authorized) ^
      const DeepCollectionEquality().hash(isAuthenticating);

  @JsonKey(ignore: true)
  @override
  $ExternalStateDataCopyWith<ExternalStateData> get copyWith =>
      _$ExternalStateDataCopyWithImpl<ExternalStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? nameValue,
            String? passValue,
            String? tokenValue,
            bool? canCheckBiometrics,
            List<BiometricType>? availableBiometrics,
            String? authorized,
            bool? isAuthenticating)
        data,
  }) {
    return data(nameValue, passValue, tokenValue, canCheckBiometrics,
        availableBiometrics, authorized, isAuthenticating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? nameValue,
            String? passValue,
            String? tokenValue,
            bool? canCheckBiometrics,
            List<BiometricType>? availableBiometrics,
            String? authorized,
            bool? isAuthenticating)?
        data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(nameValue, passValue, tokenValue, canCheckBiometrics,
          availableBiometrics, authorized, isAuthenticating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExternalStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExternalStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class ExternalStateData implements ExternalState {
  factory ExternalStateData(
      {String? nameValue,
      String? passValue,
      String? tokenValue,
      bool? canCheckBiometrics,
      List<BiometricType>? availableBiometrics,
      String? authorized,
      bool? isAuthenticating}) = _$ExternalStateData;

  @override
  String? get nameValue => throw _privateConstructorUsedError;
  @override
  String? get passValue => throw _privateConstructorUsedError;
  @override
  String? get tokenValue => throw _privateConstructorUsedError;
  @override
  bool? get canCheckBiometrics => throw _privateConstructorUsedError;
  @override
  List<BiometricType>? get availableBiometrics =>
      throw _privateConstructorUsedError;
  @override
  String? get authorized => throw _privateConstructorUsedError;
  @override
  bool? get isAuthenticating => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $ExternalStateDataCopyWith<ExternalStateData> get copyWith =>
      throw _privateConstructorUsedError;
}
