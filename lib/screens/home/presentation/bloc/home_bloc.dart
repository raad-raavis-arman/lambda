import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/screens/home/domain/entities/advertisement.dart';
import 'package:landa/screens/home/domain/usecases/usecases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.getAllAdUsecase,
  }) : super(HomeInitialState()) {
    on<HomeGetAllAdEvent>((event, emit) async {
      emit(HomeLoadingState());
      final result = await getAllAdUsecase.call(
        GetAllAdParam(
          offset: event.offset,
          limit: event.limit,
        ),
      );
      result.fold(
        (l) => emit(HomeErrorState()),
        (r) => emit(
          HomeAdvertisementsState(advertisements: r),
        ),
      );
    });
  }

  final GetAllAdUsecase getAllAdUsecase;
}
