import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_bloc.dart';
import 'package:tobeto_app/api/blocs/auth_bloc/auth_state.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/core/widget/snackbar_widget.dart';
import 'package:tobeto_app/pages/register/register_success.dart';
import 'package:tobeto_app/pages/start/login_or_register.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacementNamed(context, "/curved");
        }

        if (state is Authenticated && state.isNewUser!) {
          showDialog(
              context: context,
              builder: (context) => MyDialogSuccess(
                  title: "Tebrikler!!! Başarılı Bir şekilde Hesap Oluşturuldu",
                  color: Colors.white,
                  imagePath: "assets/images/purple_success.gif",
                  closeText: "Kapat",
                  closePressed: () => Navigator.pop(context)));
        } else if (state is NotAuthenticated && state.errorMessage != null) {
          snackBarMessage(context, state.errorMessage!);
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          context.read<ProfileBloc>().add(GetProfil());
        }

        return const LoginOrRegister();
      },
    );
  }
}
