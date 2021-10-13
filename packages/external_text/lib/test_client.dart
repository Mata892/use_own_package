import 'package:external_text/client.dart';

class TestClient implements Client {
  @override
  void testMethod() {
    print('TestClient : testMethod');
  }

  @override
  String getToken() {
    return 'token : TestClient';
  }
}
