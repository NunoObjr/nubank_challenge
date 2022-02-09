import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/_exports.dart';
import '../../mocks.dart';

void main() {
    var path = Directory.current.path;
    Hive.init(path + '/test/hive_testing_path_ui');
    const urlresponse = UrlResponse(alias: '', links: Links(self: '', short: ''));
 testWidgets(
      'Given the user in main page, when send is pressed and a text is written then a new text is created - ',
      (WidgetTester tester) async {
        MockMainBinding().dependencies();
        when(() => hiveMock.write(value:[urlresponse])).thenAnswer((_) async => true);
        when(() => hiveMock.read()).thenAnswer((_) async => []);
        await tester.pumpWidget(
          const MaterialApp(
            home: MainPage(),
          ));
        when(() => datasource.shortUrl(url: 'https://www.youtube.com/'))
            .thenAnswer((_) async => urlresponse);
        final textInput = find.byKey(const Key(ComponentsConstants.inputWidget));
        final button = find.byKey(const Key(ComponentsConstants.sendButtonWidget));
        await tester.enterText(textInput, 'https://www.youtube.com/');
        await tester.tap(button);
        await tester.pump();
        final urlWidget = find.byKey(const Key(MainPageConstants.textUrl));
        expect(urlWidget, findsOneWidget);
    });
}