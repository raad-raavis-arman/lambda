part of 'home_bloc.dart';

final class HomeState extends BaseState {
  const HomeState({
    super.status = StateStatus.initial,
    this.advertisements = const [],
  });

  final List<Advertisement> advertisements;

  HomeState copyWith({
    StateStatus? status,
    List<Advertisement>? advertisements,
  }) {
    return HomeState(
      status: status ?? this.status,
      advertisements: advertisements ?? this.advertisements,
    );
  }

  @override
  List<Object?> get props => [
        ...super.props,
        advertisements,
      ];
}
