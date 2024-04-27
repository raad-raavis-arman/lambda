import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/screens/create_advertisement/domain/usecases/creaet_advertisement_usecase.dart';

part 'create_advertisement_event.dart';
part 'create_advertisement_state.dart';

class CreateAdvertisementBloc
    extends Bloc<CreateAdvertisementEvent, CreateAdvertisementState> {
  CreateAdvertisementBloc({
    required this.createAdvertisementUsescase,
  }) : super(const CreateAdvertisementInitialState()) {
    on<CreateAdvertisementEvent>((event, emit) async {
      emit(const CreateAdvertisementLoadingState());
      final result = await createAdvertisementUsescase.call(event.param);
      result.fold((l) => emit(const CreateAdvertisementErrorState()), (r) {
        if (r) {
          emit(const CreateAdvertisementSuccessState());
        } else {
          emit(const CreateAdvertisementErrorState());
        }
      });
    });
  }

  final CreateAdvertisementUsescase createAdvertisementUsescase;
}
