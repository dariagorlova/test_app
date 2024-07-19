part of 'auth_bloc.dart';

sealed class SignInEvent {
  const SignInEvent();

  @override
  bool operator ==(Object other);

  @override
  int get hashCode;
}

class OnSignIn extends SignInEvent {
  final String email;
  final String password;

  const OnSignIn({required this.email, required this.password});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OnSignIn &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
