import 'package:dio/dio.dart';
import 'api_client.dart';
import 'api_response.dart';

class BaseRepository {
  final ApiClient _apiClient = ApiClient();

  Future<ApiResponse<T>> safeApiCall<T>(
    Future<Response> Function() apiCall,
    T Function(dynamic json) fromJson,
  ) async {
    try {
      final response = await apiCall();
      return ApiResponse.fromSuccess(fromJson(response.data));
    } on DioException catch (e) {
      return ApiResponse.fromError(
        e.response?.data?['message'] ?? e.message ?? 'Unknown error',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.fromError(e.toString());
    }
  }
}
