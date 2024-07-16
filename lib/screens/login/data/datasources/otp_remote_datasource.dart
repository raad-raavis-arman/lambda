import 'dart:async';

import 'package:dio/dio.dart';
import 'package:landa/core/error/m_exception.dart';
import 'package:landa/core/exceptions/exceptions.dart';
import 'package:landa/core/network/network.dart';
import 'package:landa/screens/login/data/models/otp_model.dart';
import 'package:landa/screens/login/domain/entities/entities.dart';

abstract interface class OtpRemoteDataSource {
  Future<Otp> sendMobileOtp(String mobileNumber);
  Future<Otp> sendEmailOtp(String email);
}

class OtpRemoteDataSourceImpl implements OtpRemoteDataSource {
  OtpRemoteDataSourceImpl({required this.restClientService});

  final RestClientService restClientService;

  @override
  Future<Otp> sendEmailOtp(String email) {
    throw UnimplementedError();
  }

  @override
  Future<Otp> sendMobileOtp(String mobileNumber) async {
    try {
      final response = await restClientService
          .post('/auth/sendOtp', data: {'mobile_number': mobileNumber});
      if (response['success'] == true) {
        return OtpModel.fromJson(response['data']);
      } else {
        throw MException(
          errorMessage: 'failed to send otp message',
          data: response,
        );
      }
    } on DioException catch (e) {
      throw MException.fromDioError(e);
    } on Exception catch (e, s) {
      unawaited(
        sentToSentry(exception: e, stackTrace: s),
      );
      rethrow;
    }
  }
}
