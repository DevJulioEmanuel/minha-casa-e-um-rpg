import '../models/user_model.dart';
import 'auth_repository.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<User> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (email == "teste@gmail.com" && password == "123456") {
      return User(id: "1", email: email);
    }

    throw Exception("Credenciais inválidas");
  }

  @override
  Future<void> logout() async {}
}
