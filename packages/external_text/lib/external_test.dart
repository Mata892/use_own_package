import 'package:external_text/client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ExternalTest {
  ExternalTest({required this.client});

  Client client;
  final storage = FlutterSecureStorage();

  String? nameValue = '';
  String? passValue = '';
  String? tokenValue = '';

  void execute() {
    client.testMethod();
  }

  void getValue(String key) async {
    String? value = await storage.read(key: key);
    print(value);
  }

  void getAllValue() async {
    Map<String, String> allValues = await storage.readAll();
    nameValue = allValues['name'];
    passValue = allValues['pass'];
    tokenValue = allValues['token'];
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
