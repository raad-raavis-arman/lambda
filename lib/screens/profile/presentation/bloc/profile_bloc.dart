import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/profile/domain/usecases/usecases.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this.signoutUsecase,
  ) : super(const ProfileState()) {
    on<SignoutEvent>((event, emit) async {
      emit(
        state.copyWith(
          status: StateStatus.loading,
        ),
      );
      final result = await signoutUsecase.call(NoParams());
      result.fold(
        (_) => emit(
          state.copyWith(status: StateStatus.error),
        ),
        (_) => emit(
          state.copyWith(
            status: StateStatus.success,
          ),
        ),
      );
    });
  }

  final SignoutUsecase signoutUsecase;
}
