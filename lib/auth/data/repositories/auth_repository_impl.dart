import 'package:dio/dio.dart';
import 'package:nota_mais/auth/domain/auth_repository.dart';
import 'package:nota_mais/utils/environment/environment.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl()
      : _dio = Dio(
          BaseOptions(
            baseUrl: Environment.baseUrlLocal,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {'Content-Type': 'application/json'},
          ),
        );

  final Dio _dio;

  @override
  Future<bool> registerUser({
    required String nome,
    required String email,
    required String dataNascimento,
    required String password,
  }) async {
    try {
      // ignore: inference_failure_on_function_invocation
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
