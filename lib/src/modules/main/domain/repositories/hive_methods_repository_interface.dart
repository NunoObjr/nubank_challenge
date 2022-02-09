import 'package:dartz/dartz.dart';
import '../../../../_exports.dart';


abstract class IHiveMethodsRepository {
  Future<Either<Failure,bool>> write({required List<UrlResponse> value});
  Future<Either<Failure,List<UrlResponse>>> read();
}
