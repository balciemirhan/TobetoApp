import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/application_bloc/application_bloc.dart';
import 'package:tobeto_app/api/blocs/application_bloc/application_event.dart';
import 'package:tobeto_app/api/blocs/application_bloc/application_state.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, state) {
        if (state is ApplicationInitial) {
          context.read<ApplicationBloc>().add(GetApplication());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ApplicationLoading) {
          // Yükleme durumunda ilerleme çubuğunu göster
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ApplicationLoaded) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: state.application.map((application) {
                return ListTile(
                  title: Text(application.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(application.subtitle),
                      Text(application.subtitle1),
                      Text(application.state)
                    ],
                  ),
                );
              }).toList(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Dialog kapatma
                },
                child: Text('Kapat'),
              ),
            ],
          );
        }

        if (state is ApplicationError) {
          // Hata durumunda hata mesajını göster
          return Center(
            child: Text(state.message),
          );
        }
        return Container();
      },
    );
  }
}
