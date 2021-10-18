import 'package:riverpod/riverpod.dart';
import 'package:external_text/test_client.dart';
import 'package:external_text/mock_client.dart';
import 'package:external_text/external_test.dart';
import 'package:external_text/external_state.dart';

final testClientProvider = Provider.autoDispose((ref) => TestClient());
final mockClientProvider = Provider.autoDispose((reg) => MockClient());
final externalTestProvider = StateNotifierProvider.autoDispose<ExternalTest, ExternalState>((ref) => ExternalTest(client: ref.read(testClientProvider)));
