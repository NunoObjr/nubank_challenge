import '_exports.dart';

class ErrorResponse extends Failure {
  ErrorResponse({
    String? code,
    String? description
  }) :super(code: code, description: description);
}