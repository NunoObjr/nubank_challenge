import 'package:dartz/dartz.dart';
import '../../../../_exports.dart';


class ShortUrlRepositoryImpl implements IShortUrlRepository {
  final IShortUrlDatasource datasource;

  ShortUrlRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, UrlResponse>> shortUrl({required String url}) async {
    try {
      final urlResponse = await datasource.shortUrl(url:url);
      return right(urlResponse);
    } catch (e) {
      return left(ErrorResponse());
    }
  }
}
