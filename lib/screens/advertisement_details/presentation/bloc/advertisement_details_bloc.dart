import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/bloc/bloc.dart';
import 'package:landa/screens/advertisement_details/domain/usecases/usecases.dart';

part 'advertisement_details_event.dart';
part 'advertisement_details_state.dart';

class AdvertisementDetailsBloc
    extends Bloc<AdvertisementDetailsEvent, AdvertisementDetailsState> {
  AdvertisementDetailsBloc(
    this.bookmarkAdvertisementUsescase,
    this.removeBookmarkAdvertisementUsescase,
  ) : super(const AdvertisementDetailsState()) {
    on<ToggleBookmarkAdvertisementEvent>(_bookmarkAdvertisement);
  }

  final BookmarkAdvertisementUsescase bookmarkAdvertisementUsescase;
  final RemoveBookmarkAdvertisementUsescase removeBookmarkAdvertisementUsescase;

  Future<void> _bookmarkAdvertisement(
    ToggleBookmarkAdvertisementEvent event,
    Emitter<AdvertisementDetailsState> emit,
  ) async {
    emit(
      const AdvertisementDetailsState(status: StateStatus.loading),
    );
    final _ = (event.isMarked)
        ? await removeBookmarkAdvertisementUsescase.call(
            RemoveBookmarkAdvertisementParam(
              id: event.advertisementId,
            ),
          )
        : await bookmarkAdvertisementUsescase.call(
            BookmarkAdvertisementParam(
              id: event.advertisementId,
            ),
          )
      ..fold(
        (_) => emit(
          const AdvertisementDetailsState(
            status: StateStatus.error,
          ),
        ),
        (isDone) {
          if (isDone) {
            emit(
              const AdvertisementDetailsState(
                status: StateStatus.success,
              ),
            );
          } else {
            emit(
              const AdvertisementDetailsState(
                status: StateStatus.error,
              ),
            );
          }
        },
      );
  }
}
