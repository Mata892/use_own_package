import 'package:external_text/client.dart';

class MockClient implements Client {
  @override
  void testMethod() {
    print('MockClient : testMethod');
  }

  @override
  String getToken() {
    return 'token : MockClient';
  }
}
