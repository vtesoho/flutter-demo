import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_iostesta/flutter_iostesta.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_iostesta');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterIostesta.platformVersion, '42');
  });
}
