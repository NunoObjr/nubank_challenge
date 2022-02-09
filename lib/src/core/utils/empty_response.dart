import '_exports.dart';

class EmptyResponse extends Failure {
  EmptyResponse({
    String? code,
    String? description
  }) :super(code: code, description: description);
}