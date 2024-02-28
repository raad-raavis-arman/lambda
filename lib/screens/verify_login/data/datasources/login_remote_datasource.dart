import 'package:dio/dio.dart';
import 'package:landa/core/error/m_dio_exception.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/screens/verify_login/data/models/login_auth_model.dart';
import 'package:landa/screens/verify_login/domain/entities/entities.dart';

abstract interface class LoginRemoteDataSource {
  Future<LoginAuth> loginWithMobile(String mobileNumber,String otpCode);
  Future<LoginAuth> loginWithEmail(String email,String otpCode);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {

  LoginRemoteDataSourceImpl({required this.restClientService});
  final RestClientService restClientService;

  @override
  Future<LoginAuth> loginWithEmail(String email,String otpCode) {
    throw UnimplementedError();
  }

  @override
  Future<LoginAuth> loginWithMobile(String mobileNumber,String otpCode) async {
    try {
      // TODO(Taleb): get real data from server
      // final response = await restClientService
      //     .post('/auth/login', data: {'mobile_number': mobileNumber,'sms_code': otpCode,});
      await Future.delayed(const Duration(seconds: 2));
      return LoginAuthModel.fromJson(const {'otpCode': '32478'});
    } on DioException catch (e) {
      throw MDioException.fromDioError(e);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
