import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:nubank_challenge/src/_exports.dart';

void main() {
  late MainBinding bindings;

  setUp(() {
    bindings = MainBinding();
  });
  group('Bindings Tests - ', () {
    group('dependencies | ', () {
      test('Test Binding', () {
        
        expect(Get.isPrepared<IShortUrlDatasource>(), false);
        expect(Get.isPrepared<IShortUrlRepository>(), false);
        expect(Get.isPrepared<IShortUrl>(), false);
        expect(Get.isPrepared<IHiveMethodsDatasource>(), false);
        expect(Get.isPrepared<IHiveMethodsRepository>(), false);
        expect(Get.isPrepared<IHiveMethods>(), false);
        expect(Get.isPrepared<MainController>(), false);
        bindings.dependencies();
        expect(Get.isPrepared<IShortUrlDatasource>(), true);
        expect(Get.isPrepared<IShortUrlRepository>(), true);
        expect(Get.isPrepared<IShortUrl>(), true);
        expect(Get.isPrepared<IHiveMethodsDatasource>(), true);
        expect(Get.isPrepared<IHiveMethodsRepository>(), true);
        expect(Get.isPrepared<IHiveMethods>(), true);
        expect(Get.isPrepared<MainController>(), true);
        Get.reset();
      });
    });
  });
}