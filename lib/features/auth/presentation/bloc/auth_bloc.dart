import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/auth/index.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final Repository _repository;

  SignInBloc({required Repository repository})
      : _repository = repository,
        super(const SignInInitial()) {
    on<OnSignIn>((event, emit) async {
      emit(const SignInProcess());
      final resultSignIn =
          await _repository.signIn(event.email, event.password);

      emit(resultSignIn == null
          ? const SignInFailure(message: 'Server error. Please try again')
          : SignInSuccess(data: resultSignIn));
    });
  }
}
