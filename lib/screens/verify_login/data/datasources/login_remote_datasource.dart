import 'package:dio/dio.dart';
import 'package:landa/core/error/m_exception.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/screens/verify_login/data/models/login_auth_model.dart';

abstract interface class LoginRemoteDataSource {
  Future<LoginAuthModel> loginWithMobile(String mobileNumber, String otpCode);
  Future<LoginAuthModel> loginWithEmail(String email, String otpCode);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl({required this.restClientService});
  final RestClientService restClientService;

  @override
  Future<LoginAuthModel> loginWithEmail(String email, String otpCode) {
    throw UnimplementedError();
  }

  @override
  Future<LoginAuthModel> loginWithMobile(
    String mobileNumber,
    String otpCode,
  ) async {
    try {
      final response = await restClientService.post(
        '/auth/login',
        data: {
          'mobile_number': mobileNumber,
          'sms_code': otpCode,
        },
      );
      if (response['success'] = true) {
        return LoginAuthModel.fromJson(response['data']);
      } else {
        throw MException(errorMessage: 'failed to verify otp', data: response);
      }
    } on DioException catch (e) {
      throw MException.fromDioError(e);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
