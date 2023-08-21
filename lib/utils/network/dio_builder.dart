import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';

import '../../common/constants/constants.dart';
import 'app_path_provider.dart';

/// [DioBuilder] will build the dio instances that will be used in the app
/// the timeout is declared in [Constants.timeoutDuration]
/// the interceptors of this dio are
/// 1- Cache interceptor with hive
/// 2- Curl interceptor the trace all the calls made in the app
/// 3- Error interceptor for better management of all kind of dio errors

class DioBuilder {
  final dio = createDio();

  DioBuilder._internal();

  static final _singleton = DioBuilder._internal();

  factory DioBuilder() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      receiveTimeout: Constants.timeoutDuration,
      connectTimeout: Constants.timeoutDuration,
      sendTimeout: Constants.timeoutDuration,
    ));

    final cacheOptions = CacheOptions(
      store: HiveCacheStore(AppPathProvider.path),
      policy: CachePolicy.refreshForceCache,
      hitCacheOnErrorExcept: [],
      maxStale: const Duration(
        days: 30,
      ),
      priority: CachePriority.high,
    );

    dio.interceptors.addAll([
      AppInterceptors(dio),
      DioCacheInterceptor(options: cacheOptions),
    ]);
    if (kDebugMode) {
      dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    }

    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(
      {
        Headers.contentTypeHeader: "application/json",
      },
    );
    options.followRedirects = false;
    options.validateStatus = (status) {
      return status != null ? status >= 200 && status < 300 : false;
    };
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
}

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
