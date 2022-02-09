import 'package:dartz/dartz.dart';
import '../../../../_exports.dart';


abstract class IHiveMethods {
  Future<Either<Failure,bool>> write({required List<UrlResponse> value});
  Future<Either<Failure,List<UrlResponse>>> read();
}

class HiveMethodsImpl implements IHiveMethods {
  final IHiveMethodsRepository repository;

  HiveMethodsImpl(this.repository);

  @override
  Future<Either<Failure,bool>> write({required List<UrlResponse> value}) async {
    return await repository.write(value: value);
  }
    @override
  Future<Either<Failure,List<UrlResponse>>> read() async {
    return await repository.read();
  }
}
