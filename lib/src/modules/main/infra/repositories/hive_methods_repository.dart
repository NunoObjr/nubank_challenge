import 'package:dartz/dartz.dart';
import '../../../../_exports.dart';


class HiveMethodsRepositoryImpl implements IHiveMethodsRepository {
  final IHiveMethodsDatasource datasource;

  HiveMethodsRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<UrlResponseModel>>> read() async{
    try {
      final urlResponse = await datasource.read();
      return right(urlResponse);
    } on Failure catch (e){
      return left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> write({required List<UrlResponse> value}) async{
    
    try {
      final writeResponse = await datasource.write(value: value);
      return right(writeResponse);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
