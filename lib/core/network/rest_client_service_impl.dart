import 'package:dio/dio.dart';
import 'package:landa/core/network/authorization_interceptor.dart';
import 'package:landa/core/network/network.dart';
import 'package:sentry_dio/sentry_dio.dart';

class RestClientServiceImpl implements RestClientService {
  RestClientServiceImpl(
    this.authorizationInterceptor,
  ) {
    _initializeDio();
  }

  final AuthorizationInterceptor authorizationInterceptor;

  late final Dio _dio;

  void _initializeDio() {
    _dio = Dio(
      BaseOptions(
        //baseUrl: 'https://lambda-api.gymino.ir/api/v1/',
        baseUrl: 'http://127.0.0.1:8000/api/v1/',
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
      ),
    );
    _dio.interceptors.addAll(
      [
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
        authorizationInterceptor,
      ],
    );
    _dio.addSentry();
  }

  @override
  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if (response.statusCode == 204 || response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('something went wrong');
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('something went wrong');
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('something went wrong');
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final respnse = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (respnse.statusCode == 200) {
        return respnse.data;
      } else {
        throw Exception('something went wrong');
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
