import 'package:dw9_delivery_app/app/models/auth_model.dart';

abstract class AuthRepository {
  Future<void> register(String name, String email, String password);
  Future<AuthModel> login(String name, String password);
}
