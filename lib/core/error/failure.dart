import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<dynamic> properties;
  final String message;
  const Failure(this.message,[this.properties = const <dynamic>[]]);

  @override
  List<Object?> get props => properties;
}

final class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

final class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

final class NoConnectionFailure extends Failure {
  const NoConnectionFailure(super.message);
}
