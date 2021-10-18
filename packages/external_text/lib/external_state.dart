import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';
import 'package:external_text/support_state.dart';

part 'external_state.freezed.dart';

@freezed
class ExternalState with _$ExternalState {
  factory ExternalState.data({
    @Default('') String? nameValue,
    @Default('') String? passValue,
    @Default('') String? tokenValue,
    @Default(SupportState.unknown) SupportState supportState,
    @Default(false) bool? canCheckBiometrics,
    @Default([]) List<BiometricType>? availableBiometrics,
    @Default('Not Authrized') String? authorized,
    @Default(false) bool? isAuthenticating,
  }) = ExternalStateData;
}
