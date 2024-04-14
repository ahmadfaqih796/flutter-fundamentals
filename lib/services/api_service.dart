import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> fetchData(String url) async {
    try {
      return await _dio.get(url);
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  // Implementasi fungsi-fungsi lain untuk berinteraksi dengan API.
}
