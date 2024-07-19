import 'dart:async';

import 'package:dio/dio.dart';
import 'package:test_app/core/index.dart';
import 'package:test_app/features/auth/index.dart';

abstract class ApiService {
  FutureOr<User?> signIn(String email, String password);
}

class ApiServiceImpl implements ApiService {
  @override
  FutureOr<User?> signIn(String email, String password) async {
    try {
      final response = await Dio().get(
        signInUrl,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data['results'][0]);
      }
      return null;
    } catch (error) {
      return null;
    }
  }
}
