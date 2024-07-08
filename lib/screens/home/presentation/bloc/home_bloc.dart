import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/advertisement_category/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_category/domain/usecases/usecases.dart';
import 'package:landa/screens/home/domain/entities/entities.dart';
import 'package:landa/screens/home/domain/usecases/usecases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.getAllAdUsecase,
    required this.getCategoriesUsescase,
  }) : super(const HomeState()) {
    on<HomeGetAllAdEvent>(_getAllAdvertisements);
    on<HomeGetAllCategoriesEvent>(_getAllCategories);
  }

  final GetAllAdUsecase getAllAdUsecase;
  final GetCategoriesUsescase getCategoriesUsescase;

  Future<void> _getAllCategories(
    HomeGetAllCategoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await getCategoriesUsescase.call(NoParams());
    result.fold(
      (_) => null,
      (r) => emit(
        state.copyWith(categoryData: r),
      ),
    );
  }

  Future<void> _getAllAdvertisements(
    HomeGetAllAdEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));
    final result = await getAllAdUsecase.call(
      GetAllAdParam(
        query: AdvertisementQuery(
          offset: event.offset,
          limit: event.limit,
          query: event.query,
        ),
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
  }
}
