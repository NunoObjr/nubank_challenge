import 'package:dartz/dartz.dart';
import '../../../../_exports.dart';


abstract class IShortUrl {
  Future<Either<Failure,UrlResponse>> call({required String url});
}

class ShortUrlImpl implements IShortUrl {
  final IShortUrlRepository repository;

  ShortUrlImpl(this.repository);

  @override
  Future<Either<Failure,UrlResponse>> call({required String url}) async {
    return await repository.shortUrl(url: url);
  }
}
