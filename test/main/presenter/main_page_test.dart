import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nubank_challenge/src/_exports.dart';
import 'package:nubank_challenge/src/core/constants/presenter/_exports.dart';

void main() {
  testWidgets(
      'Given the user in main page, when send is pressed and a text is written then a new text is created - ',
      (WidgetTester tester) async {
    await Hive.initFlutter();
    await tester.pumpWidget(
      GetMaterialApp(
        enableLog: true,
        getPages: AppPages.routes,
        initialBinding: MainBinding(),
        initialRoute: AppPages.mainPage,
        debugShowCheckedModeBanner: false,
      )
    );
    final textInput = find.byKey(const Key(ComponentsConstants.inputWidget));
    final button = find.byKey(const Key(ComponentsConstants.sendButtonWidget));
    await tester.enterText(textInput, 'https://www.youtube.com/');
    await tester.tap(button);
    final urlWidget = find.byKey(const Key(MainPageConstants.textUrl));
    expect(urlWidget, findsOneWidget);
  });

}
