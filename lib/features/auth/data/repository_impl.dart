import 'dart:async';

import 'package:test_app/features/auth/index.dart';

class RepositoryImpl implements Repository {
  final ApiService _apiService;

  const RepositoryImpl(this._apiService);

  @override
  FutureOr<User?> signIn(String email, String password) =>
      _apiService.signIn(email, password);
}
