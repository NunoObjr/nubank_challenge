import 'package:nubank_challenge/src/modules/main/domain/entities/_exports.dart';

abstract class IShortUrlDatasource {
  Future<UrlResponse> shortUrl({required String url});
}
