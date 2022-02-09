import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/_exports.dart';
import '../../../mocks.dart';

void main() {
  late IHiveMethods hiveMethods;
  setUp(() {
    hiveMethods = HiveMethodsMock();
  });
  group('IHiveMethods Tests - ', () {
    test('when performed write, should return a right', () async {  
      when(() => hiveMethods.write(value: []))
      .thenAnswer((_) async => right(true) );
      var result = await hiveMethods.write(value: []);
      expect(result.isRight(), true);
    });
    test('when performed read, should return a right', () async {  
      when(() => hiveMethods.read())
      .thenAnswer((_) async => right([]) );
      var result = await hiveMethods.read();
      expect(result.isRight(), true);
    });
    test('when performed read, if is left, should return a failure', () async {  
      when(() => hiveMethods.read())
      .thenAnswer((_) async => left(ErrorResponse()) );
      var result = await hiveMethods.read();
      expect(result.fold((l) => l, (r) => r), isA<Failure>());
    });
    test('when performed write, if is left, should return a failure', () async {  
      when(() => hiveMethods.write(value:[]))
      .thenAnswer((_) async => left(ErrorResponse()) );
      var result = await hiveMethods.write(value:[]);
      expect(result.fold((l) => l, (r) => r), isA<Failure>());
    });
  });
}
