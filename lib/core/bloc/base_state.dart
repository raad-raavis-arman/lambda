import 'package:equatable/equatable.dart';
import 'package:landa/core/bloc/bloc.dart';

abstract class BaseState extends Equatable {
  const BaseState({required this.status});

  final StateStatus status;

  @override
  List<Object?> get props => [status];
}
