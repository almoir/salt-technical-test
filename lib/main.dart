import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_technical_test/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:salt_technical_test/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:salt_technical_test/presentation/pages/home_page.dart';

import 'config/theme.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/splash_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationThemeData(),
        initialRoute: SplashPage.routeName,
        routes: {
          SplashPage.routeName: (context) => const SplashPage(),
          LoginPage.routeName: (context) => const LoginPage(),
          HomePage.routeName: (context) => const HomePage(),
        },
      ),
    );
  }
}
