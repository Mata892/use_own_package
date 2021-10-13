library external_text;

import 'package:flutter/material.dart';

// import 'package:external_text/poke_text.dart';
import 'package:external_package/external_package.dart' as test;
import 'package:test_package/poke_text.dart';
import 'package:external_text/external_test.dart';
import 'package:test_package/test_package.dart' as tp;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:dio/dio.dart' as Dio;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final storage = new FlutterSecureStorage();
  final server = MockWebServer(port: 9990);
  final dio = Dio.Dio();
  final headers = <String, String>{'content-type': 'application/json'};
  Map<String?, String> values = {'name': '', 'pass': '', 'token': ''};
  String? nameValue = '';
  String? passValue = '';
  String? tokenValue = '';

  void initState() {
    super.initState();
    server.start();
    // update();
  }

  void dispose() {
    server.shutdown();
    super.dispose();
  }

  void update() async {
    setState(() async {
      nameValue = await storage.read(key: 'name');
      passValue = await storage.read(key: 'pass');
      tokenValue = await storage.read(key: 'token');
    });
  }

  void getValue(String key) async {
    String? value = await storage.read(key: key);
    print(value);
  }

  void getAllValue() async {
    Map<String, String> allValues = await storage.readAll();
    setState(() {
      nameValue = allValues['name'];
      passValue = allValues['pass'];
      tokenValue = allValues['token'];
    });
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

  void checkExist() async {
    server.enqueue(httpCode: 200, body: 'c1l79IzCJ1Gt');

    final result = await dio.get<String>(
      'http://127.0.0.1:9990',
      options: Dio.Options(
        headers: headers,
      ),
    );

    print(result);

    saveValue('token', result.data!);
  }

  void _incrementCounter() {
    setState(() {
      // _counter++;
      // _counter = Calculator().addOne(_counter);
      _counter = test.Calculator().addState(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
              '$_counter',
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
                      saveValue('name', 'NameName');
                    },
                  ),
                  ElevatedButton(
                    child: Text('読み込み'),
                    onPressed: () {
                      getValue('name');
                    },
                  ),
                  ElevatedButton(
                    child: Text('削除'),
                    onPressed: () {
                      deleteValue('name');
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
                      saveValue('pass', 'Password');
                    },
                  ),
                  ElevatedButton(
                    child: Text('読み込み'),
                    onPressed: () {
                      getValue('pass');
                    },
                  ),
                  ElevatedButton(
                    child: Text('削除'),
                    onPressed: () {
                      deleteValue('pass');
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
                      deleteAllValue();
                    },
                  ),
                  ElevatedButton(
                    child: Text('全て読み込み'),
                    onPressed: () {
                      getAllValue();
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: Text('問い合わせ'),
              onPressed: () {
                checkExist();
              },
            ),
            Text('name value is ${nameValue}'),
            Text('pass value is ${passValue}'),
            Text('token value is ${tokenValue}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
