import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/screens/home/domain/entities/advertisement.dart';
import 'package:landa/screens/home/domain/usecases/usecases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.getAllAdUsecase,
  }) : super(const HomeState()) {
    on<HomeGetAllAdEvent>((event, emit) async {
      emit(state.copyWith(status: StateStatus.loading));
      final result = await getAllAdUsecase.call(
        GetAllAdParam(
          offset: event.offset,
          limit: event.limit,
        ),
      );
      result.fold(
        (l) => emit(state.copyWith(status: StateStatus.error)),
        (r) {
          List<Advertisement> data = state.advertisements;
          if (event.offset > 0) {
            data.addAll(r);
          } else {
            data = r;
          }
          emit(
            state.copyWith(advertisements: data, status: StateStatus.success),
          );
        },
      );
    });
  }

  final GetAllAdUsecase getAllAdUsecase;
}
