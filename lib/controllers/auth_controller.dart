import 'package:get/get.dart';
import 'package:dio/dio.dart';

class AuthController extends GetxController {
  final Dio _dio = Dio();

  Future<void> register(String name, String email, String password) async {
    try {
      // const String url = 'http://127.0.0.1/auth/register';
      // const String url = 'https://dummyjson.com/users/add';

      const String url = 'http://localhost:9090/auth/register';

      BaseOptions options = BaseOptions(
        // baseUrl: 'http://localhost:9090',
        baseUrl: 'https://dummyjson.com',
        connectTimeout: 5000,
        receiveTimeout: 3000,
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer <token>'
        },
      );

      // Set opsi ke Dio
      _dio.options = options;
      final response = await _dio.post(
        // '/auth/register',
        '/users/add',
        data: {
          // 'full_name': name,
          // 'email': email,
          // 'password': password,
          // 'position': 'ADMIN',
          // 'telephone': '999090',
          "firstName": 'Muhammad',
          "lastName": 'Ovi',
          "age": 250,
        },
      );
      if (response.statusCode == 200) {
        print('User registered successfully with response: ${response.data}');
      } else {
        throw Exception('Failed to register user');
      }
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }
}
