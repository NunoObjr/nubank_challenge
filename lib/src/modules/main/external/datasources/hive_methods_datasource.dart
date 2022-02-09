import 'package:hive/hive.dart';
import '../../../../_exports.dart';

class HiveMethodsDatasourceImpl implements IHiveMethodsDatasource {
  final constants = HiveMethodsDatasourceImplConstants();
  @override
  Future<List<UrlResponseModel>> read() async {
    try {
      var box = await Hive.openBox(constants.field);
      final urls = await box.get(constants.hive);
      final response = [].cast<UrlResponseModel>();
      await Hive.close();
     
      if(urls != null) {
        urls[constants.field].forEach((element){
          response.add(UrlResponseModel.fromMap(element));
        });
      }
      return response;
    } on HiveError catch (e) {
      throw ErrorResponse(description:e.message);
    }
  }
  @override
  Future<bool> write({required List<UrlResponse> value}) async {
    final saveValue = value.map((element) => UrlResponseModel.toMap(element)).toList();
    try {
      var box = await Hive.openBox(constants.field);
      await box.put(constants.hive,{constants.field:saveValue});
      await Hive.close();
      return true;
    } on HiveError catch (e) {
      throw ErrorResponse(description:e.message);
    }
  }
}
