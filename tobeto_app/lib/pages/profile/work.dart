import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile/personal_widget.dart';

class Work extends StatelessWidget {
  const Work({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          final user = state.user;
          return ProfilWidget(
            text: "Deneyim",
            widget: user.workHistory != null
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: user.workHistory!.length,
                    itemBuilder: (context, index) {
                      final work = user.workHistory![index];

                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(work.organizationName!),
                              Text(work.position!),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(work.sector!),
                              Text(work.city!),
                            ],
                          ),
                          Text("${work.startDate} - ${work.endDate}"),
                          Text(work.workDescription!)
                        ],
                      );
                    },
                  )
                : const SizedBox(),
          );
        }
        return Container();
      },
    );
  }
}
