import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/pages/curved/curved_button.dart';
import 'package:tobeto_app/pages/start/login_or_register.dart';
import 'package:tobeto_app/pages/start/splash_screen.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const SplashScreen();
        }
        if (state is Authenticated) {
          context.read<ProfileBloc>().add(GetProfil());
          return const CurvedNavBarWidget();
        }

        return const LoginOrRegister();
      },
    );
  }
}
