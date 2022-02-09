import 'package:dartz/dartz.dart';
import '../../../../_exports.dart';


abstract class IShortUrlRepository {
  Future<Either<Failure, UrlResponse>> shortUrl({required String url});
}
