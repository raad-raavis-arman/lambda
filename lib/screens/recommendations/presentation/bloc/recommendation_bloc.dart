import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/bloc/base_state.dart';
import 'package:landa/core/bloc/state_status.dart';
import 'package:landa/screens/recommendations/domain/entities/entities.dart';
import 'package:landa/screens/recommendations/domain/usecases/usecases.dart';

part 'recommendation_event.dart';
part 'recommendation_state.dart';

class RecommendationBloc
    extends Bloc<RecommendationEvent, RecommendationState> {
  RecommendationBloc(
    this.sendRecommendationUsecase,
  ) : super(const RecommendationState()) {
    on<SendRecommendation>((event, emit) async {
      emit(state.copyWith(status: StateStatus.loading));
      final result = await sendRecommendationUsecase.call(
        SendRecommendationParam(
          recommendation: Recommendation(
            subject: event.subject,
            description: event.description,
          ),
        ),
      );

      return result.fold(
        (_) => emit(state.copyWith(status: StateStatus.error)),
        (isSend) => isSend
            ? emit(
                state.copyWith(status: StateStatus.success),
              )
            : emit(
                state.copyWith(
                  status: StateStatus.error,
                ),
              ),
      );
    });
  }

  final SendRecommendationUsecase sendRecommendationUsecase;
}
