import 'package:dio/dio.dart';
import '../../../../_exports.dart';

class ShortUrlDatasourceImpl implements IShortUrlDatasource {

  @override
  Future<UrlResponseModel> shortUrl({required String url}) async {
    final constants = ShortUrlDatasourceImplConstants();
    try {
      final response = await Dio(BaseOptions(baseUrl: ServicesConfig.shortUrlEndpoint)).post(constants.aliasEndPoint, data: {constants.data:url});
      final urlModel = UrlResponseModel.fromMap(response.data);
      return urlModel;
    } on DioError catch (e) {
      throw ErrorResponse(description:e.message);
    }
  }
}
