import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/constant/format/date_formatter.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile/personal_widget.dart';

class Education extends StatelessWidget {
  const Education({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          final user = state.user;
          return ProfilWidget(
              text: "Eğitim",
              widget: user.educationHistory != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: user.educationHistory!.length,
                      itemBuilder: (context, index) {
                        final education = user.educationHistory![index];
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 190),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppTextTheme.xSmall(
                                          education.schoolName!, context),
                                      AppTextTheme.xSmall(
                                          education.department!, context),
                                    ],
                                  ),
                                ),
                                Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 110),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AppTextTheme.xSmall(
                                          education.educationStatus!, context),
                                      AppTextTheme.xSmall(
                                          education.city!, context),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                                "${DateFormatter.dateFormatter.format(education.startDate ?? DateTime.now())} - ${DateFormatter.dateFormatter.format(education.endDate ?? DateTime.now())}"),
                            const Divider()
                          ],
                        );
                      },
                    )
                  : const SizedBox());
        }
        return Container();
      },
    );
  }
}
