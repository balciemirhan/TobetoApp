import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/application_bloc/application_bloc.dart';
import 'package:tobeto_app/api/blocs/application_bloc/application_event.dart';
import 'package:tobeto_app/api/blocs/application_bloc/application_state.dart';
import 'package:tobeto_app/models/application_model.dart';

class CustomDialog extends StatelessWidget {
  final List<Application> applicationList;

  const CustomDialog({Key? key, required this.applicationList})
      : super(key: key);

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
          final application =
              applicationList[0]; // applicationList'den ilk öğeyi alıyoruz
          return Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(application.title, style: TextStyle(fontSize: 24)),
                  Text(application.subtitle,style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(application.subtitle1),
                  Text(application.state),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Kapat'),
                  ),
                ],
              ),
            ),
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
