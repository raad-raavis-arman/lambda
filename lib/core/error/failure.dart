import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message,[this.properties = const <dynamic>[]]);
  final List<dynamic> properties;
  final String message;

  @override
  List<Object?> get props => properties;
}

final class LocalFailure extends Failure {
  const LocalFailure(super.message);
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
