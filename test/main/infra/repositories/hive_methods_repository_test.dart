import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/_exports.dart';
import '../../../mocks.dart';
void main() {
  late IHiveMethodsRepository repository;
  late IHiveMethodsDatasource datasource;
  const urlResponse = UrlResponseModel(alias: '', links: null);


  setUp(() {
    datasource = HiveMethodsDatasourceMock();
    repository = HiveMethodsRepositoryImpl(datasource);
  });

  group('HiveMethodsRepository Tests - ', () {
    test('when write is requested, should return a bool',
          () async {
        when(() => datasource.write(value: []))
            .thenAnswer((_) async => true);
        var result = await repository.write(value: []);
        expect(result.fold(id, id), isA<bool>());
      });
    test('when read is requested, should return a List of UrlResponseModel',
          () async {
        when(() => datasource.read())
            .thenAnswer((_) async => [urlResponse]);
        var result = await repository.read();
        expect(result.fold(id, id), isA<List<UrlResponseModel>>());
      });
  });
}
