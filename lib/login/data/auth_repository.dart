import 'package:dio/dio.dart';

class AuthRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8080',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<bool> registerUser({
    required String nome,
    required String email,
    required String dataNascimento,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/teacher',
        data: {
          'name': nome,
          'email': email,
          'dataNascimento': dataNascimento,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      return false;
    }
  }
}
