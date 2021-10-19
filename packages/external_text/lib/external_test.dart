import 'package:external_text/client.dart';
import 'package:external_text/external_state.dart';
import 'package:external_text/support_state.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod/riverpod.dart';
import 'package:local_auth/local_auth.dart';

class ExternalTest extends StateNotifier<ExternalState> {
  ExternalTest({required this.client}) : super(ExternalState.data());

  Client client;
  final storage = FlutterSecureStorage();

  final LocalAuthentication auth = LocalAuthentication();

  void execute() {
    client.testMethod();
  }

  // 以下は全てロジックで実装した方がいい？（いわゆるViewModelでする処理ではない？）
  // ログイン関係
  void validate() {

  }

  // KeyChain関係
  void getValue(String key) async {
    String? value = await storage.read(key: key);
    print(value);
  }

  void getAllValue() async {
    Map<String, String> allValues = await storage.readAll();
    state = state.copyWith(
      nameValue: allValues['name'],
      passValue: allValues['pass'],
      tokenValue: allValues['token'],
    );
    print(allValues);
  }

  void saveValue(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  void deleteValue(String key) async {
    await storage.delete(key: key);
  }

  void deleteAllValue() async {
    await storage.deleteAll();
  }

  void getToken() {
    final result = client.getToken();
    saveValue('token', result);
  }

  // 生体認証関係
  void isDeviceSupported() async {
    bool isSupported = await auth.isDeviceSupported();
    state = state.copyWith(
      supportState: isSupported ? SupportState.supported : SupportState.unsupported,
    );
  }

  Future<void> checkBiometrics() async {
    late bool canCheckBiometrics;

    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on Exception catch (e) {
      canCheckBiometrics = false;
      print(e);
    }

    if (!mounted) return;

    state = state.copyWith(
      canCheckBiometrics: canCheckBiometrics,
    );
  }

  Future<void> getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;

    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on Exception catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }

    if (!mounted) return;

    state = state.copyWith(
      availableBiometrics: availableBiometrics,
    );
  }

  Future<void> authenticate() async {
    bool authenticated = false;

    try {
      state = state.copyWith(
        isAuthenticating: true,
        authorized: 'Authenticating',
      );
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        useErrorDialogs: true,
        stickyAuth: true
      );
      state = state.copyWith(
        isAuthenticating: false,
      );
    } on Exception catch (e) {
      print(e);
      state = state.copyWith(
        isAuthenticating: false,
        authorized: 'Error - ${e}',
      );
      return;
    }

    if (!mounted) return;

    state = state.copyWith(
      authorized: authenticated ? 'Authorized' : 'Not Authorized',
    );
  }

  Future<void> authenticateWithBiometrics() async {
    bool authenticated = false;

    try {
      state = state.copyWith(
        isAuthenticating: true,
        authorized: 'Authenticating',
      );
      authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint (or face or whatever) to authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: true,
      );
      state = state.copyWith(
        isAuthenticating: false,
        authorized: 'Authenticating',
      );
    } on Exception catch (e) {
      print(e);
      state = state.copyWith(
        isAuthenticating: false,
        authorized: 'Error - ${e}',
      );
      return;
    }

    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    state = state.copyWith(
      authorized: message,
    );
  }

  void cancelAuthentication() async {
    await auth.stopAuthentication();
    state = state.copyWith(
      isAuthenticating: false
    );
  }
}
