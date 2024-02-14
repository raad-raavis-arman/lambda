part of 'lang_bloc.dart';

sealed class LangEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class LangFetchLocalEvent extends LangEvent {}
