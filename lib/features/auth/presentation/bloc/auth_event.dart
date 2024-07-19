part of 'auth_bloc.dart';

sealed class SignInEvent {
  const SignInEvent();
}

class OnSignIn extends SignInEvent {
  final String email;
  final String password;

  const OnSignIn({required this.email, required this.password});
}
