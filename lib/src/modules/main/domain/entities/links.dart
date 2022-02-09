// coverage:ignore-file
import 'package:equatable/equatable.dart';

class Links extends Equatable {
  final String? self;
  final String? short;

  const Links({
    this.self,
    this.short
  });

  @override
  List<Object?> get props => [self, short];

}
