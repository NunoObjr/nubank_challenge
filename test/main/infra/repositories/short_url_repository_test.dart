import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/_exports.dart';
import '../../../mocks.dart';
void main() {
  late IShortUrlRepository repository;
  late IShortUrlDatasource datasource;
  const urlResponse = UrlResponse();


  setUp(() {
    datasource = ShortUrlDatasourceMock();
    repository = ShortUrlRepositoryImpl(datasource);
  });

  group('ShortUrlRepository Tests - ', () {
    test('when shortUrl is requested, should return a UrlResponse',
          () async {
        when(() => datasource.shortUrl(url: 'url'))
            .thenAnswer((_) async => urlResponse);
        var result = await repository.shortUrl(url: 'url');
        expect(result.fold(id, id), isA<UrlResponse>());
      });
  });
}
