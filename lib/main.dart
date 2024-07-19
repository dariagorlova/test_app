import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/index.dart';
import 'package:test_app/features/auth/index.dart';
import 'package:test_app/features/home/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the device orientation to portrait only.
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInBloc>(
          create: (BuildContext context) => SignInBloc(
            repository: RepositoryImpl(ApiServiceImpl()),
          ),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(
            repository: HomeRepositoryImpl(HomeApiServiceImpl()),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Test project',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme,
          useMaterial3: true,
        ),
        home: const AuthScreen(),
      ),
    );
  }
}
