import 'package:external_text/client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod/riverpod.dart';

class ExternalState {
  String? nameValue = '';
  String? passValue = '';
  String? tokenValue = '';
}

class ExternalTest extends StateNotifier<ExternalState> {
  ExternalTest({required this.client}) : super(ExternalState());

  Client client;
  final storage = FlutterSecureStorage();

  void execute() {
    client.testMethod();
  }

  void getValue(String key) async {
    String? value = await storage.read(key: key);
    print(value);
  }

  void getAllValue() async {
    Map<String, String> allValues = await storage.readAll();
    ExternalState value = ExternalState();
    value.nameValue = allValues['name'];
    value.passValue = allValues['pass'];
    value.tokenValue = allValues['token'];
    state = value;
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
}
