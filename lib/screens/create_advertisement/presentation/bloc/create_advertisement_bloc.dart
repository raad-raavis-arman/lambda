import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/screens/create_advertisement/domain/usecases/creaet_advertisement_usecase.dart';

part 'create_advertisement_event.dart';
part 'create_advertisement_state.dart';

class CreateAdvertisementBloc
    extends Bloc<CreateAdvertisementEvent, CreateAdvertisementState> {
  CreateAdvertisementBloc({
    required this.createAdvertisementUsescase,
  }) : super(CreateAdvertisementInitialState()) {
    on<CreateAdvertisementEvent>((event, emit) async {
      emit(CreateAdvertisementLoadingState());
      final result = await createAdvertisementUsescase.call(event.param);
      result.fold((l) => emit(CreateAdvertisementErrorState()), (r) {
        if (r) {
          emit(CreateAdvertisementSuccessState());
        } else {
          emit(CreateAdvertisementErrorState());
        }
      });
    });
  }

  final CreateAdvertisementUsescase createAdvertisementUsescase;
}
