import 'dart:async';

import 'package:test_app/features/auth/index.dart';

abstract class Repository {
  FutureOr<User?> signIn(String email, String password);
}
