import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Thêm token nếu có
    // final token = AuthService.getToken();
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Xử lý lỗi chung
    switch (err.response?.statusCode) {
      case 401:
        // Token hết hạn → refresh token hoặc logout
        break;
      case 403:
        // Không có quyền
        break;
      case 500:
        // Server error
        break;
    }
    handler.next(err);
  }
}
