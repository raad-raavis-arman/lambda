import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  const Recommendation({
    required this.subject,
    required this.description,
  });

  final String subject;
  final String description;

  @override
  List<Object?> get props => [
        subject,
        description,
      ];
}
