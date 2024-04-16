import 'package:get/get.dart';
import 'package:dio/dio.dart';

class AuthController extends GetxController {
  final Dio _dio = Dio();

  Future<void> register(String name, String email, String password) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: 'http://192.168.113.151:3030',
        // baseUrl: 'https://0b9e-2a09-bac1-34e0-30-00-279-20.ngrok-free.app',
        // baseUrl: 'https://dummyjson.com',
        connectTimeout: 5000,
        receiveTimeout: 3000,
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer <token>',
        },
      );

      _dio.options = options;
      final response = await _dio.post(
        '/users',
        // '/users/add',
        data: {
          'full_name': name,
          'email': email,
          'password': password,
          // 'position': 'ADMIN',
          // 'telephone': '999090',
          // "firstName": name,
          // "lastName": email,
          // "age": 250,
        },
      );
      print(response);
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
