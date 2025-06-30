import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class IAuthRepository {
  Future<dynamic> login({required String username, required String password});
}

@Injectable(as: IAuthRepository)
class AuthRepository extends IAuthRepository {
  final Dio dio;
  AuthRepository(this.dio);
  @override
  Future<dynamic> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'auth/login',
        data: {"username": username, "password": password},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
