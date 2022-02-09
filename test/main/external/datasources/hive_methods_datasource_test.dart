import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  var path = Directory.current.path;
  Hive.init(path + '/test/hive_testing_path');

  group('HiveMethodsDatasourceImpl Tests - ', () {
    test('when hive methods is used, should return the correct value', () async {
      final box = await Hive.openBox('tests');
      await box.put('key', 'value');
      var result = await box.get('key');
      expect(result, isA<String>());
    });
  });
}
