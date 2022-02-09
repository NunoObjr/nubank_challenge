import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/_exports.dart';
import 'package:nubank_challenge/src/modules/main/domain/usecases/short_url_usecase.dart';
import '../../../mocks.dart';

void main() {
  late IShortUrl shortUrl;
  setUp(() {
    shortUrl = ShortUrLMock();
  });
  group('IShortUrl Tests - ', () {
    test('when performed shortUrl, should return a right', () async {  
      when(() => shortUrl(url: 'url'))
      .thenAnswer((_) async => right(const UrlResponse()) );
      var result = await shortUrl(url: 'url');
      expect(result.isRight(), true);
    });
    test('when performed shortUrl, if is a left, should return a ErrorResponse', () async {  
      when(() => shortUrl(url: 'url'))
      .thenAnswer((_) async => left(ErrorResponse()));
      var result = await shortUrl(url: 'url');
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (r) => r), isA<ErrorResponse>());
    });
  });
}
