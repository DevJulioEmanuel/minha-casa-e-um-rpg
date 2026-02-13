import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/features/welcome/data/models/user_model.dart';
import 'package:minha_casa_rpg_app/features/welcome/data/repository/auth_repository.dart';
import 'package:minha_casa_rpg_app/features/welcome/data/repository/fake_auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FakeAuthRepository();
});

final authControllerProvider =
  AsyncNotifierProvider<AuthController, User?>(AuthController.new);

class AuthController extends AsyncNotifier<User?> {
  late final AuthRepository _repository;

  @override
  Future<User?> build() async {
    _repository = ref.read(authRepositoryProvider);
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final user = await _repository.login(email, password);
      return user;
    }); 

    Future<void> logout() async {
      await _repository.logout();
      state = const AsyncData(null);
    }
  }
} 