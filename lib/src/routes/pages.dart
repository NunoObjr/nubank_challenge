import 'package:get/get.dart';
import '../modules/_exports.dart';
import 'routes.dart';
class AppPages {
  static String mainPage = AppRoutes.mainPage;
  static final routes = [
    GetPage(
      name: mainPage,
      page: () => const MainPage(),
      binding: MainBinding(),
    )
  ];
}