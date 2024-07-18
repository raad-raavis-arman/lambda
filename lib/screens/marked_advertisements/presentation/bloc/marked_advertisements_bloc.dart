import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/core/usecase/usecase.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/advertisement.dart';
import 'package:landa/screens/shared/domain/advertisements/usecases/get_my_marked_ads_usecase.dart';

part 'marked_advertisements_event.dart';
part 'marked_advertisements_state.dart';

class MarkedAdvertisementsBloc
    extends Bloc<MarkedAdvertisementsEvent, MarkedAdvertisementsState> {
  MarkedAdvertisementsBloc(
    this.getMyMarkedAdsUsecase,
  ) : super(const MarkedAdvertisementsState()) {
    on<GetAllMarkedAdvertisementsEvent>((event, emit) async {
      emit(
        state.copyWith(status: StateStatus.loading),
      );
      final result = await getMyMarkedAdsUsecase.call(NoParams());
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

  final GetMyMarkedAdsUsecase getMyMarkedAdsUsecase;
}
