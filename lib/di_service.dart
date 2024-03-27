import 'package:get_it/get_it.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/screens/advertisement_area/data/datasources/province_local_datasource.dart';
import 'package:landa/screens/advertisement_area/data/repositories/province_repository_impl.dart';
import 'package:landa/screens/advertisement_area/domain/repositories/province_repository.dart';
import 'package:landa/screens/advertisement_area/domain/usecases/cities_usecase.dart';
import 'package:landa/screens/advertisement_area/domain/usecases/provinces_usecase.dart';
import 'package:landa/screens/advertisement_category/data/datasources/datasources.dart';
import 'package:landa/screens/advertisement_category/data/repositories/category_repository_impl.dart';
import 'package:landa/screens/advertisement_category/data/repositories/sub_category_repository_impl.dart';
import 'package:landa/screens/advertisement_category/domain/usecases/usecases.dart';
import 'package:landa/screens/create_advertisement/data/datasources/create_advertisement_remote_datasource.dart';
import 'package:landa/screens/create_advertisement/data/repositories/create_advertisement_repository_impl.dart';
import 'package:landa/screens/create_advertisement/domain/repositories/repositories.dart';
import 'package:landa/screens/create_advertisement/domain/usecases/creaet_advertisement_usecase.dart';
import 'package:landa/screens/login/data/datasources/datasources.dart';
import 'package:landa/screens/login/data/repositories/repositories.dart';
import 'package:landa/screens/login/domain/repositories/repositories.dart';
import 'package:landa/screens/login/domain/usecases/usecases.dart';
import 'package:landa/screens/verify_login/data/datasources/datasources.dart';
import 'package:landa/screens/verify_login/data/repositories/repositories.dart';
import 'package:landa/screens/verify_login/domain/repositories/repositories.dart';
import 'package:landa/screens/verify_login/domain/usecases/usecases.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
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
      () => UserLoginRepositoryImpl(
        loginRemoteDataSource: locator.get(),
        preferences: locator.get(),
      ),
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
    )

    //register for AdvertisementAreaBloc
    ..registerLazySingleton(
      () => CitiesUsecase(
        provinceRepository: locator.get(),
      ),
    )
    ..registerLazySingleton(
      () => ProvincesUsecase(
        provinceRepository: locator.get(),
      ),
    )
    ..registerLazySingleton<ProvinceRepository>(
      () => ProvinceRepositoryImpl(
        provinceLocalDatasource: locator.get(),
      ),
    )
    ..registerLazySingleton(
      ProvinceLocalDatasource.new,
    )

    // register shared preferences
    ..registerLazySingleton(() => preferences)

    // register package info pluse
    ..registerLazySingleton(() => packageInfo)

    // CreateAdvertisementBloc depencies
    ..registerLazySingleton(
      () => CreateAdvertisementUsescase(
        createAdvertisementRepository: locator.get(),
      ),
    )
    ..registerLazySingleton<CreateAdvertisementRepository>(
      () => CreateAdvertisementRepositoryImpl(
        remoteDatasource: locator.get(),
      ),
    )
    ..registerLazySingleton(
      () => CreateAdvertisementRemoteDatasource(
        restClientService: locator.get(),
        preferences: locator.get(),
      ),
    );
}
