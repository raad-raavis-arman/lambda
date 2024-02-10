import 'package:get_it/get_it.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/screens/login/data/datasources/datasources.dart';
import 'package:landa/screens/login/data/repositories/repositories.dart';
import 'package:landa/screens/login/domain/repositories/repositories.dart';
import 'package:landa/screens/login/domain/usecases/usecases.dart';
import 'package:landa/screens/login/presentation/bloc/login_bloc.dart';

final locator = GetIt.instance;

void setup() {
  locator
    ..registerFactory(() => LoginBloc(userOtp: locator.get()))
    ..registerFactory(() => UserOtpUsescase(userOtpRepository: locator.get()))
    ..registerLazySingleton<UserOtpRepository>(
      () => UserOtpRepositoryImpl(otpRemoteDataSource: locator.get()),
    )
    ..registerLazySingleton<OtpRemoteDataSource>(
      () => OtpRemoteDataSourceImpl(
        restClientService: locator.get(),
      ),
    )
    ..registerLazySingleton<RestClientService>(RestClientServiceImpl.new);
}
