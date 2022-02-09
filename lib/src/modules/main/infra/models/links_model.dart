import 'package:nubank_challenge/src/core/constants/_exports.dart';
import 'package:nubank_challenge/src/modules/main/domain/entities/_exports.dart';

class LinksModel extends Links {
  const LinksModel(
      {required String self,
      required String short})
      : super(
            self: self,
            short: short);

  static LinksModel? fromMap(Map map) {
    return LinksModel(
      self: map[ConstantsLinksModels.self],
      short: map[ConstantsLinksModels.short]
    );
  }

  static Map<String, dynamic> toMap(Links links) {
    return {
      ConstantsLinksModels.self: links.self,
      ConstantsLinksModels.short: links.short
    };
  }
}
