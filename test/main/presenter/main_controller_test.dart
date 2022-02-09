import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/_exports.dart';
import 'package:nubank_challenge/src/modules/main/domain/usecases/short_url_usecase.dart';

import '../../mocks.dart';

void main() {
  late IShortUrlDatasource datasource;
  late IHiveMethods hiveMethods;
  var path = Directory.current.path;
  Hive.init(path + '/test/hive_testing_path');
  const urlresponse = UrlResponse(alias: '', links: Links(self: '', short: ''));
  setUp(() {
    datasource = ShortUrlDatasourceMock();
    hiveMethods = HiveMethodsMock();
    Get.lazyPut<IShortUrlDatasource>(() => datasource);
    Get.lazyPut<IShortUrlRepository>(() => ShortUrlRepositoryImpl(Get.find()));
    Get.lazyPut<IShortUrl>(() => ShortUrlImpl(Get.find()));
    Get.lazyPut<IHiveMethodsDatasource>(() => HiveMethodsDatasourceImpl());
    Get.lazyPut<IHiveMethodsRepository>(
        () => HiveMethodsRepositoryImpl(Get.find()));
    Get.lazyPut<IHiveMethods>(() => HiveMethodsImpl(Get.find()));
    Get.lazyPut<MainController>(() => MainController(Get.find(), Get.find()));
  });
  tearDown(() {
    Get.reset();
    Hive.deleteBoxFromDisk('urls');
  });

  group('Controller Tests - ', () {
    group('shorUrl methods / ', () {
      test('when performed shortUrl, should have 1 value', () async {
        when(() => datasource.shortUrl(url: ''))
            .thenAnswer((_) async => urlresponse);
        Hive.deleteBoxFromDisk('urls');
        final controller = Get.find<MainController>();
        expect(controller.initialized, true);
        controller.urlText.text = '';
        await controller.shortUrl();
        await Future.delayed(const Duration(seconds: 2));
        expect(controller.state!.length, 1);
        Get.reset();
      });
    });
    group('hive methods / ', () {
      test('when performed loadUrls, should be empty', () async {
        Hive.deleteBoxFromDisk('urls');
        when(() => hiveMethods.read()).thenAnswer((_) async => right([]));
        final controller = Get.find<MainController>();
        expect(controller.initialized, true);
        await controller.loadUrls();
        expect(0, controller.state!.length);
        Get.reset();
      });
    });
  });
}
