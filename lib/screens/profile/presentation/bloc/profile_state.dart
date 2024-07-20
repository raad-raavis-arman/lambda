part of 'profile_bloc.dart';

final class ProfileState extends BaseState {
  const ProfileState({
    super.status = StateStatus.initial,
  });

  ProfileState copyWith({
    StateStatus? status,
  }) =>
      ProfileState(
        status: status ?? this.status,
      );
}
