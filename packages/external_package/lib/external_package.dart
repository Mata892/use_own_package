library external_package;
import 'package:external_package/state.dart';

// 以下は使用できない
// pubspec.yamlにパッケージを記載することで使用できるようになる
// import 'package:use_own_package/use_own_package.dart';
// import 'package:use_own_package/main.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 30;

  int addState(int value) => value + num;
}
