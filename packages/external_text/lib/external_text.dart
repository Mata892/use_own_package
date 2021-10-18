library external_text;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:test_package/poke_text.dart';
import 'package:external_text/support_state.dart';
import 'package:external_text/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProviderScope(child: _MyHomePageState()),
    );
  }
}

class _MyHomePageState extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final externalTest = useProvider(externalTestProvider);
    final externalTestMethod = useProvider(externalTestProvider.notifier);

    useEffect(() {
      externalTestMethod.isDeviceSupported();
    }, [externalTest]);

    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PokeText(
                'abc',
                size: 48,
              ),
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '0',
                style: Theme.of(context).textTheme.headline4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('key : name'),
                    ElevatedButton(
                      child: Text('保存'),
                      onPressed: () {
                        externalTestMethod.saveValue('name', 'NameName');
                      },
                    ),
                    ElevatedButton(
                      child: Text('読み込み'),
                      onPressed: () {
                        externalTestMethod.getValue('name');
                      },
                    ),
                    ElevatedButton(
                      child: Text('削除'),
                      onPressed: () {
                        externalTestMethod.deleteValue('name');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('key : pass'),
                    ElevatedButton(
                      child: Text('保存'),
                      onPressed: () {
                        externalTestMethod.saveValue('pass', 'Password');
                      },
                    ),
                    ElevatedButton(
                      child: Text('読み込み'),
                      onPressed: () {
                        externalTestMethod.getValue('pass');
                      },
                    ),
                    ElevatedButton(
                      child: Text('削除'),
                      onPressed: () {
                        externalTestMethod.deleteValue('pass');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      child: Text('全削除'),
                      onPressed: () {
                        externalTestMethod.deleteAllValue();
                      },
                    ),
                    ElevatedButton(
                      child: Text('全て読み込み'),
                      onPressed: () {
                        externalTestMethod.getAllValue();
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('問い合わせ'),
                onPressed: () {
                  externalTestMethod.getToken();
                },
              ),
              Text('name value is ${externalTest.nameValue}'),
              Text('pass value is ${externalTest.passValue}'),
              Text('token value is ${externalTest.tokenValue}'),
              // 生体認証関係
              if (externalTest.supportState == SupportState.unknown)
                CircularProgressIndicator()
              else if (externalTest.supportState == SupportState.supported)
                Text('This device is supported')
              else
                Text('Thie device is not supported'),
              Divider(height: 10),
              Text('Available biometrics: ${externalTest.availableBiometrics}\n'),
              ElevatedButton(
                child: const Text('Get available biometrics'),
                onPressed: externalTestMethod.getAvailableBiometrics,
              ),
              Divider(height: 10),
              Text('Current State: ${externalTest.authorized}\n'),
              (externalTest.isAuthenticating ?? false)
                  ? ElevatedButton(
                      onPressed: externalTestMethod.cancelAuthentication,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Cancel Authentication'),
                          Icon(Icons.cancel),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        ElevatedButton(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Authenticate'),
                              Icon(Icons.perm_device_information),
                            ],
                          ),
                          onPressed: externalTestMethod.authenticate,
                        ),
                        ElevatedButton(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(externalTest.isAuthenticating ?? false
                                  ? 'Cancel'
                                  : 'Authenticate: biometrics only'),
                              Icon(Icons.fingerprint),
                            ],
                          ),
                          onPressed:
                              externalTestMethod.authenticateWithBiometrics,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
