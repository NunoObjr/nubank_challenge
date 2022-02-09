import 'package:nubank_challenge/src/_exports.dart';

class UrlResponseModel extends UrlResponse {
  const UrlResponseModel(
      {required String alias,
      required LinksModel? links})
      : super(
            alias: alias,
            links: links);

  static UrlResponseModel fromMap(Map map) {
    return UrlResponseModel(
      alias: map[ConstantsUrlResponseModels.alias],
      links: LinksModel.fromMap(map[ConstantsUrlResponseModels.links])
    );
  }

  static Map<String, dynamic> toMap(UrlResponse urlResponse) {
    return {
      ConstantsUrlResponseModels.alias: urlResponse.alias,
      ConstantsUrlResponseModels.links: LinksModel.toMap(urlResponse.links!)
    };
  }
}
