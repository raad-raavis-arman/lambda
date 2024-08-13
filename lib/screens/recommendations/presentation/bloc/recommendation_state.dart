part of 'recommendation_bloc.dart';

final class RecommendationState extends BaseState {
  const RecommendationState({
    super.status = StateStatus.initial,
  });

  RecommendationState copyWith({StateStatus? status}) => RecommendationState(
        status: status ?? this.status,
      );
}
