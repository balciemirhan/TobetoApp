import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/application_bloc/application_bloc.dart';
import 'package:tobeto_app/api/blocs/application_bloc/application_event.dart';
import 'package:tobeto_app/api/blocs/application_bloc/application_state.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/application_model.dart';

class ApplicationDialog extends StatelessWidget {
  const ApplicationDialog({Key? key}) : super(key: key);

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
          final List<Application> application =
              state.application; // applicationList'den ilk öğeyi alıyoruz
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AppTextTheme.medium(application[0].title, context),
                AppTextTheme.xSmall("- ${application[0].subtitle} -", context),
                AppTextTheme.xSmall("o ${application[0].subtitle1}", context),
                AppTextTheme.xSmall("o ${application[0].state}", context),
              ],
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
