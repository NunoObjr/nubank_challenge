import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/_exports.dart';

class ShortUrlDatasourceMock extends Mock implements IShortUrlDatasource {}

class HiveMock extends Mock implements HiveInterface {}

class HiveMethodsMock extends Mock implements IHiveMethods {}

class ShortUrLMock extends Mock implements ShortUrlImpl {}

class HiveMethodsDatasourceMock extends Mock implements IHiveMethodsDatasource {}