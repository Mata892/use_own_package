library external_text;

import 'package:flutter/material.dart';

import 'package:test_package/poke_text.dart';
import 'package:external_text/support_state.dart';
import 'package:external_text/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: ProviderScope(child: _MyHomePageState()),
        home: LoginView(),
      ),
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
              Text(
                  'Available biometrics: ${externalTest.availableBiometrics}\n'),
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
    );
  }
}

class LoginView extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController rePass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final externalTest = useProvider(externalTestProvider);
    final externalTestMethod = useProvider(externalTestProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: AutofillGroup(
            child: Column(
              children: [
                const Text('メールアドレス'),
                TextFormField(
                    controller: name,
                    enabled: true,
                    autofillHints: [AutofillHints.name],
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    }),
                Divider(height: 10),
                const Text('パスワード'),
                TextFormField(
                    controller: pass,
                    enabled: true,
                    autofillHints: [AutofillHints.newPassword],
                    keyboardType: TextInputType.visiblePassword,
                    autovalidateMode: AutovalidateMode.always,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    }),
                Divider(height: 10),
                const Text('パスワード再入力'),
                TextFormField(
                    controller: rePass,
                    enabled: true,
                    autofillHints: [AutofillHints.newPassword],
                    keyboardType: TextInputType.visiblePassword,
                    autovalidateMode: AutovalidateMode.always,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (pass.text != rePass.text) {
                        return 'Not same value';
                      }
                      return null;
                    }),
                Divider(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        externalTestMethod.saveValue('name', name.text);
                        externalTestMethod.saveValue('pass', pass.text);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return _MyHomePageState();
                        }));
                      }
                    },
                    child: const Text('ログイン'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
