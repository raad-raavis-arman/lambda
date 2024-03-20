part of 'new_version_bloc.dart';

final class NewVersionState extends Equatable {
  const NewVersionState({
    this.isNewVersion = false,
  });

  final bool isNewVersion;

  @override
  List<Object> get props => [
        isNewVersion,
      ];
}
