part of 'auth_bloc.dart';

sealed class SignInState {
  const SignInState();

  @override
  bool operator ==(Object other);

  @override
  int get hashCode;
}

final class SignInInitial extends SignInState {
  const SignInInitial();
}

class SignInSuccess extends SignInState {
  final User data;
  const SignInSuccess({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SignInSuccess && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class SignInFailure extends SignInState {
  final String message;
  const SignInFailure({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SignInFailure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class SignInProcess extends SignInState {
  const SignInProcess();
}
