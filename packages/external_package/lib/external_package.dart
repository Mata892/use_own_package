library external_package;

// 以下は使用できない
// import 'package:use_own_package/use_own_package.dart';
import 'package:use_own_package/main.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 30;
}
