import 'package:alice/alice.dart';
import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:dio/dio.dart';
import 'api_interceptor.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;

  late final Dio dio;
  static final Alice alice = Alice();
  static final AliceDioAdapter _aliceDioAdapter = AliceDioAdapter();

  ApiClient._internal() {
    alice.addAdapter(_aliceDioAdapter);

    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/data/2.5',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(_aliceDioAdapter);
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  // GET
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio.get(path, queryParameters: queryParameters);
  }

  // POST
  Future<Response> post(String path, {dynamic data}) async {
    return dio.post(path, data: data);
  }

  // PUT
  Future<Response> put(String path, {dynamic data}) async {
    return dio.put(path, data: data);
  }

  // DELETE
  Future<Response> delete(String path, {dynamic data}) async {
    return dio.delete(path, data: data);
  }
}
