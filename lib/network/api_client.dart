
import 'package:dio/dio.dart';

class ApiClient {
  // Singleton
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() {
    return _instance;
  }

  late final Dio _dio;

  ApiClient._internal() {
    _dio = Dio(
      BaseOptions(

        baseUrl:
            'https://692ada4f7615a15ff24de2ce.mockapi.io/rustai/api/',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );
  }

  // Common GET
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // Common POST
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // Common PUT
  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // Common DELETE
  Future<dynamic> delete(
    String path, {
    dynamic data,
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
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // Centralized error handling
  ApiException _handleDioError(DioException e) {
    final statusCode = e.response?.statusCode;
    final message = e.message ?? 'Unknown error';

    // You can customize messages per status code
    if (statusCode == 401) {
      return ApiException(
        message: 'Unauthorized. Please login again.',
        statusCode: statusCode,
      );
    } else if (statusCode == 404) {
      return ApiException(
        message: 'Resource not found.',
        statusCode: statusCode,
      );
    } else if (statusCode == 500) {
      return ApiException(
        message: 'Server error. Please try later.',
        statusCode: statusCode,
      );
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return ApiException(
        message: 'Connection timeout. Check your internet.',
        statusCode: statusCode,
      );
    } else if (e.type == DioExceptionType.connectionError) {
      return ApiException(
        message: 'No internet connection.',
        statusCode: statusCode,
      );
    }

    return ApiException(message: message, statusCode: statusCode);
  }
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({required this.message, this.statusCode});

  @override
  String toString() => 'ApiException($statusCode): $message';
}
