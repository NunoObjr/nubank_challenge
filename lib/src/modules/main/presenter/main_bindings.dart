import '../../../_exports.dart';
import 'package:get/get.dart';
import '_exports.dart';

class MainBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<IShortUrlDatasource>(() => ShortUrlDatasourceImpl());
  Get.lazyPut<IShortUrlRepository>(() => ShortUrlRepositoryImpl(Get.find()));
  Get.lazyPut<IShortUrl>(() => ShortUrlImpl(Get.find()));
  Get.lazyPut<IHiveMethodsDatasource>(() => HiveMethodsDatasourceImpl());
  Get.lazyPut<IHiveMethodsRepository>(() => HiveMethodsRepositoryImpl(Get.find()));
  Get.lazyPut<IHiveMethods>(() => HiveMethodsImpl(Get.find()));
  Get.lazyPut<MainController>(() => MainController(Get.find(),Get.find()));
  }
}