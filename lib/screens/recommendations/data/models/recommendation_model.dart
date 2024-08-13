import 'package:json_annotation/json_annotation.dart';
import 'package:landa/screens/recommendations/domain/entities/entities.dart';

part 'recommendation_model.g.dart';

@JsonSerializable()
class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required super.subject,
    required super.description,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationModelToJson(this);
}
