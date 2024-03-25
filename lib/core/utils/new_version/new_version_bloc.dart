import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:landa/core/utils/utils.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'new_version_event.dart';
part 'new_version_state.dart';

class NewVersionBloc extends Bloc<NewVersionEvent, NewVersionState> {
  NewVersionBloc({
    required this.packageInfo,
    required this.preferences,
  }) : super(const NewVersionState()) {
    on<CheckNewVersionEvent>((event, emit) async {
      final savedVersion = preferences.getString(PreferenceKeys.version);
      final currentVersion =
          '${packageInfo.version}+${packageInfo.buildNumber}';
      if (savedVersion != currentVersion) {
        emit(const NewVersionState(isNewVersion: true));
        await preferences.setString(PreferenceKeys.version, currentVersion);
      } else {
        emit(const NewVersionState());
      }
    });
  }

  final SharedPreferences preferences;
  final PackageInfo packageInfo;
}
