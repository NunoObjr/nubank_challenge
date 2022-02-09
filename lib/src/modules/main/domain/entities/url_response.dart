// coverage:ignore-file
import 'package:equatable/equatable.dart';
import 'links.dart';

class UrlResponse extends Equatable {
  final String? alias;
  final Links? links;

  const UrlResponse({
    this.alias,
    this.links
  });

  @override
  List<Object?> get props => [alias, links];

}
