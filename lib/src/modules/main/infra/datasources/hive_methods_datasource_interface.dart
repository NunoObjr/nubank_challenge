import 'package:nubank_challenge/src/_exports.dart';

abstract class IHiveMethodsDatasource {
  Future<List<UrlResponseModel>> read();
  Future<bool> write({required List<UrlResponse> value});
}
