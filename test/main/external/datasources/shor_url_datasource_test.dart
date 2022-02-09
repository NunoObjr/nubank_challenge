import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/_exports.dart';
import '../../../mocks.dart';

void main() async{
 
  late IShortUrlDatasource datasource;
  const urlResponse = UrlResponse();
  setUp(() {
    datasource = ShortUrlDatasourceMock();
  });
  group('ShortUrlDatasourceImpl Tests - ', () {
    test('when shortUrl is used, should return a UrlResponseModel', () async {
      when(() => datasource.shortUrl(url:''))
            .thenAnswer((_) async => urlResponse);
      final result = await  datasource.shortUrl(url:'');
      expect(result, isA<UrlResponse>());
    });
  });
}
