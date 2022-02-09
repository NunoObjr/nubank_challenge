import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/_exports.dart';

void main() async{
  await Hive.initFlutter();
  runApp(GetMaterialApp(
    enableLog: true,
    getPages: AppPages.routes,
    initialBinding: MainBinding(),
    initialRoute: AppPages.mainPage,
    debugShowCheckedModeBanner: false,
  ));
}
