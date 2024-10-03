import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(String baseUrl)
      : _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<Response> getRequest(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return response;
    } on DioError catch (e) {
      // Handle Dio errors (like network or server errors)
      throw Exception('Failed to get data: ${e.response?.statusCode ?? e.message}');
    }
  }

  Future<Response> postRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioError catch (e) {
      // Handle Dio errors
      throw Exception('Failed to post data: ${e.response?.statusCode ?? e.message}');
    }
  }

  // You can add more methods for PUT, DELETE, etc., if needed
}
