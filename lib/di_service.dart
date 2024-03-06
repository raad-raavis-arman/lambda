import 'package:get_it/get_it.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/data/repositories/category_repository_impl.dart';
import 'package:landa/screens/advertisement_category/data/repositories/sub_category_repository_impl.dart';
import 'package:landa/screens/advertisement_category/domain/usecases/usecases.dart';
import 'package:landa/screens/login/data/datasources/datasources.dart';
import 'package:landa/screens/login/data/repositories/repositories.dart';
import 'package:landa/screens/login/domain/repositories/repositories.dart';
import 'package:landa/screens/login/domain/usecases/usecases.dart';
import 'package:landa/screens/verify_login/data/datasources/datasources.dart';
import 'package:landa/screens/verify_login/data/repositories/repositories.dart';
import 'package:landa/screens/verify_login/domain/repositories/repositories.dart';
import 'package:landa/screens/verify_login/domain/usecases/usecases.dart';

final locator = GetIt.instance;

void setup() {
  locator
    // register LoginBloc
    ..registerFactory(() => UserOtpUsescase(userOtpRepository: locator.get()))
    ..registerLazySingleton<UserOtpRepository>(
      () => UserOtpRepositoryImpl(otpRemoteDataSource: locator.get()),
    )
    ..registerLazySingleton<OtpRemoteDataSource>(
      () => OtpRemoteDataSourceImpl(
        restClientService: locator.get(),
      ),
    )
    ..registerLazySingleton<RestClientService>(RestClientServiceImpl.new)

    // register VerifyLoginBloc
    ..registerLazySingleton(
      () => UserLoginUsescase(userLoginRepository: locator.get()),
    )
    ..registerLazySingleton<UserLoginRepository>(
      () => UserLoginRepositoryImpl(loginRemoteDataSource: locator.get()),
    )
    ..registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(
        restClientService: locator.get(),
      ),
    )

    // register CategoryBloc
    ..registerLazySingleton(
      () => GetCategoriesUsescase(
        categoryRepository: locator.get(),
      ),
    )
    ..registerLazySingleton(
      () => GetSubCategoriesUsescase(
        subCategoryRepository: locator.get(),
      ),
    )
    ..registerLazySingleton(
      () => SuggestCategoryUsescase(
        categoryRepository: locator.get(),
      ),
    )
    ..registerLazySingleton(
      () => SuggestSubCategoryUsescase(
        subCategoryRepository: locator.get(),
      ),
    )
    ..registerLazySingleton(
      () => CategoryRepositoryImpl(
        categoryLocalDataSourceImpl: locator.get(),
        categoryRemoteDataSourceImpl: locator.get(),
      ),
    )
    ..registerLazySingleton(
      () => SubCategoryRepositoryImpl(
        subcategoryRemoteDataSourceImpl: locator.get(),
        subcategoryLocalDataSourceImpl: locator.get(),
      ),
    )
    ..registerLazySingleton(
      () => const CategoryLocalDataSourceImpl(),
    )
    ..registerLazySingleton(
      () => CategoryRemoteDataSourceImpl(
        restClientService: locator.get(),
      ),
    )
    ..registerLazySingleton(
      () => SubCategoryRemoteDataSourceImpl(
        restClientService: locator.get(),
      ),
    )
    ..registerLazySingleton(
      () => const SubCategoryLocalDataSourceImpl(),
    );
}
