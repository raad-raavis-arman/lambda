import 'package:dio/dio.dart';
import 'package:landa/core/error/m_dio_exception.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/screens/login/data/models/otp_model.dart';
import 'package:landa/screens/login/domain/entities/entities.dart';

abstract interface class OtpRemoteDataSource {
  Future<Otp> sendMobileOtp(String mobileNumber);
  Future<Otp> sendEmailOtp(String email);
}

class OtpRemoteDataSourceImpl implements OtpRemoteDataSource {
  final RestClientService restClientService;

  OtpRemoteDataSourceImpl({required this.restClientService});

  @override
  Future<Otp> sendEmailOtp(String email) {
    throw UnimplementedError();
  }

  @override
  Future<Otp> sendMobileOtp(String mobileNumber) async {
    try {
      final response = await restClientService
          .post('/otp', data: {'mobileNumber': mobileNumber});
      return OtpModel.fromJson(response);
    } on DioException catch (e) {
      throw MDioException.fromDioError(e);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
