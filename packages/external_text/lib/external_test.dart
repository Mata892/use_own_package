import 'package:external_text/client.dart';
import 'package:external_text/external_state.dart';

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
}
