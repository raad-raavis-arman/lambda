import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
  }) : super(const AdvertisementAreaDataState()) {
    on<AdvertisementAreaInitialEvent>((event, emit) async {
      emit(AdvertisementAreaLoadingState());
      final cities = await citiesUsecase.call(NoParams());
      final provinces = await provincesUsecase.call(NoParams());
      final cityList = cities.fold<List<City>>(
        (l) {
          emit(AdvertisementAreaErrorState());
          return [];
        },
        (r) => r,
      );
      final provinceList = provinces.fold<List<Province>>(
        (l) {
          emit(AdvertisementAreaErrorState());
          return [];
        },
        (r) => r,
      );

      final map = provinceList.asMap().map((index, value) {
        return MapEntry(
          provinceList[index],
          cityList
              .where((element) => element.provinceId == value.provinceId)
              .toList(),
        );
      });

      emit(AdvertisementAreaDataState(data: map));
    });
  }

  final CitiesUsecase citiesUsecase;
  final ProvincesUsecase provincesUsecase;
}
