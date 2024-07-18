import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/advertisement.dart';
import 'package:landa/screens/shared/domain/advertisements/usecases/get_my_ads_usecase.dart';

part 'my_advertisements_event.dart';
part 'my_advertisements_state.dart';

class MyAdvertisementsBloc
    extends Bloc<MyAdvertisementsEvent, MyAdvertisementsState> {
  MyAdvertisementsBloc(
    this.getMyAdsUsecase,
  ) : super(const MyAdvertisementsState()) {
    on<GetMyAdvertisementsEvent>((event, emit) async {
      emit(
        state.copyWith(status: StateStatus.loading),
      );
      final result = await getMyAdsUsecase.call(NoParams());
      result.fold(
        (_) => emit(state.copyWith(status: StateStatus.error)),
        (data) => emit(
          state.copyWith(
            status: StateStatus.success,
            data: data,
          ),
        ),
      );
    });
  }

  final GetMyAdsUsecase getMyAdsUsecase;
}
