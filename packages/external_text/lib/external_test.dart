import 'package:external_text/client.dart';

class ExternalTest {
  ExternalTest({required this.client});

  Client client;

  void execute() {
    client.testMethod();
  }
}
