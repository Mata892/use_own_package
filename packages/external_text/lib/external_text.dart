library external_text;

import 'package:flutter/material.dart';

// import 'package:external_text/poke_text.dart';
import 'package:external_package/external_package.dart' as test;
import 'package:test_package/poke_text.dart';
import 'package:external_text/external_test.dart';
import 'package:external_text/provider.dart';
import 'package:test_package/test_package.dart' as tp;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:dio/dio.dart' as Dio;

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
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: ProviderScope(child: _MyHomePageState()),
    );
  }
}

class _MyHomePageState extends HookWidget {
  int _counter = 0;

  // final storage = new FlutterSecureStorage();
  // final server = MockWebServer(port: 9990);
  // final dio = Dio.Dio();
  // final headers = <String, String>{'content-type': 'application/json'};

  @override
  Widget build(BuildContext context) {
    final externalTest = useProvider(externalTestProvider);
    final externalTestMethod = useProvider(externalTestProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Center(
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
              '$externalTest',
              style: Theme.of(context).textTheme.headline4,
            ),
            // tp.TestImage(),
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
          ],
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
