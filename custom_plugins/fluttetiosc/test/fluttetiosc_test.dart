import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttetiosc/fluttetiosc.dart';

void main() {
  const MethodChannel channel = MethodChannel('fluttetiosc');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Fluttetiosc.platformVersion, '42');
  });
}
