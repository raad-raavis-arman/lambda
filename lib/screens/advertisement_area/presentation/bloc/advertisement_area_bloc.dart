import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/bloc/base_state.dart';
import 'package:landa/core/bloc/state_status.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/advertisement_area/domain/entities/entities.dart';
import 'package:landa/screens/advertisement_area/domain/usecases/usecases.dart';

part 'advertisement_area_event.dart';
part 'advertisement_area_state.dart';

class AdvertisementAreaBloc
    extends Bloc<AdvertisementAreaEvent, AdvertisementAreaState> {
  AdvertisementAreaBloc({
    required this.citiesUsecase,
    required this.provincesUsecase,
  }) : super(const AdvertisementAreaState()) {
    on<AdvertisementAreaInitialEvent>((event, emit) async {
      emit(
        state.copyWith(
          status: StateStatus.loading,
        ),
      );
      final cities = await citiesUsecase.call(NoParams());
      final provinces = await provincesUsecase.call(NoParams());
      final cityList = cities.fold<List<City>>(
        (l) {
          emit(
            state.copyWith(
              status: StateStatus.error,
            ),
          );
          return [];
        },
        (r) => r,
      );
      final provinceList = provinces.fold<List<Province>>(
        (l) {
          emit(
            state.copyWith(
              status: StateStatus.error,
            ),
          );
          return [];
        },
        (r) => r,
      );

      final map = provinceList.asMap().map((index, value) {
        return MapEntry(
          provinceList[index],
          cityList.where((element) => element.provinceId == value.id).toList(),
        );
      });

      emit(
        state.copyWith(
          data: map,
          status: StateStatus.success,
        ),
      );
    });
  }

  final CitiesUsecase citiesUsecase;
  final ProvincesUsecase provincesUsecase;
}
