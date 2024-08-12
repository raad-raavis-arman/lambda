part of 'recommendation_bloc.dart';

sealed class RecommendationEvent extends Equatable {
  const RecommendationEvent();

  @override
  List<Object> get props => [];
}

final class SendRecommendation extends RecommendationEvent {
  const SendRecommendation({
    required this.subject,
    required this.description,
  });

  final String subject;
  final String description;

  @override
  List<Object> get props => [subject, description];
}
