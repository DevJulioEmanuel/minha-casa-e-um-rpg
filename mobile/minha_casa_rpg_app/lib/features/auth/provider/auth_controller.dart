import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:minha_casa_rpg_app/features/auth/data/models/auth_status.dart';
import 'package:minha_casa_rpg_app/features/auth/services/auth_service.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<AuthStatus?>>(
  (ref) => AuthController(AuthService()),
);  

class AuthController extends StateNotifier<AsyncValue<AuthStatus?>> {
  final AuthService remote;

  AuthController(this.remote) : super(const AsyncValue.data(AuthStatus.unauthenticated));

  Future<void> register(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      await remote.register(email, password);
      state = AsyncValue.data(AuthStatus.authenticated);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      await remote.login(email, password);
      state = AsyncValue.data(AuthStatus.authenticated);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}