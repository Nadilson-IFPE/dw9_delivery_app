import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dw9_delivery_app/app/core/exceptions/repository_exception.dart';
import 'package:dw9_delivery_app/app/core/exceptions/unauthorized_exception.dart';
import 'package:dw9_delivery_app/app/core/rest_client/custom_dio.dart';
import 'package:dw9_delivery_app/app/models/auth_model.dart';
import 'package:dw9_delivery_app/app/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio customDio;

  AuthRepositoryImpl({
    required this.customDio,
  });

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await customDio.unauth().post('/auth', data: {
        'email': email,
        'password': password,
      });

      return AuthModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == HttpStatus.unauthorized ||
          e.response?.statusCode == HttpStatus.forbidden) {
        log('Permissão negada!', error: e, stackTrace: s);
        throw UnauthorizedException();
      }

      log('Erro ao realizar login!', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao realizar login!');
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await customDio.unauth().post('/users', data: {
        'name': name,
        'email': email,
        'password': password,
      });
    } on Exception catch (e, s) {
      log('Erro ao registrar usuário!', error: e, stackTrace: s);
      throw RepositoryException(message: 'Error ao registrar usuário!');
    }
  }
}
