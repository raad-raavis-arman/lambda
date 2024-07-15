import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/bloc/bloc.dart';

part 'advertisement_details_event.dart';
part 'advertisement_details_state.dart';

class AdvertisementDetailsBloc
    extends Bloc<AdvertisementDetailsEvent, AdvertisementDetailsState> {
  AdvertisementDetailsBloc() : super(const AdvertisementDetailsState()) {
    on<BookmarkAdvertisementEvent>(_bookmarkAdvertisement);
  }

  Future<void> _bookmarkAdvertisement(
    BookmarkAdvertisementEvent event,
    Emitter<AdvertisementDetailsState> emit,
  ) async {}
}
