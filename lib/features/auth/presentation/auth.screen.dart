import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/auth/index.dart';
import 'package:test_app/features/home/index.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              showCloseIcon: true,
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else if (state is SignInSuccess) {
          context.read<HomeBloc>().add(const OnFetchData());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: _formSignInKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CaptionWidget(text: 'Sign in'),
                          const SizedBox(height: 72),
                          InputField.email(
                            controller: emailController,
                            disabled: state is SignInProcess,
                          ),
                          const SizedBox(height: 36),
                          InputField.password(
                            controller: passwordController,
                            disabled: state is SignInProcess,
                          ),
                          const SizedBox(height: 48),
                          LoginButton(
                            onPressed: state is SignInProcess ? null : _login,
                            child: state is SignInProcess
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  )
                                : Text(
                                    'Log in',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _login() {
    if (_formSignInKey.currentState!.validate()) {
      context.read<SignInBloc>().add(
            OnSignIn(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
    }
  }
}
