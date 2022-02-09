import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/_exports.dart';

class ShortUrlDatasourceMock extends Mock implements IShortUrlDatasource {}

class HiveDatasourceMock extends Mock implements IHiveMethodsDatasource {}

class HiveMock extends Mock implements HiveInterface {}

class HiveMethodsMock extends Mock implements IHiveMethods {}

class ShortUrLMock extends Mock implements ShortUrlImpl {}

class HiveMethodsDatasourceMock extends Mock implements IHiveMethodsDatasource {}
final datasource = ShortUrlDatasourceMock();
final hiveMock = HiveDatasourceMock();

class MockMainBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<IShortUrlDatasource>(() => datasource);
  Get.lazyPut<IShortUrlRepository>(() => ShortUrlRepositoryImpl(Get.find()));
  Get.lazyPut<IShortUrl>(() => ShortUrlImpl(Get.find()));
  Get.lazyPut<IHiveMethodsDatasource>(() => hiveMock);
  Get.lazyPut<IHiveMethodsRepository>(() => HiveMethodsRepositoryImpl(Get.find()));
  Get.lazyPut<IHiveMethods>(() => HiveMethodsImpl(Get.find()));
  Get.lazyPut<MainController>(() => MainController(Get.find(),Get.find()));
  }
}