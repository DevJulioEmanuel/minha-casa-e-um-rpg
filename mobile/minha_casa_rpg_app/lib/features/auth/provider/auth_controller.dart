import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:minha_casa_rpg_app/features/auth/data/models/user_model.dart';
import 'package:minha_casa_rpg_app/features/auth/services/auth_service.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<User?>>(
  (ref) => AuthController(AuthService()),
);

class AuthController extends StateNotifier<AsyncValue<User?>> {
  final AuthService remote;

  AuthController(this.remote) : super(const AsyncValue.data(null));

  Future<void> register(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final data = await remote.register(email, password);

      final user = User.fromJson(data);
      state = AsyncValue.data(user);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final data = await remote.login(email, password);
      final user = User.fromJson(data);
      
      state = AsyncValue.data(user);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}