import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/constant/format/date_formatter.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: AppTextTheme.xSmall(
                                textAlign: TextAlign.center,
                                work.organizationName!,
                                context),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                constraints: const BoxConstraints(maxWidth: 90),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppTextTheme.xSmall(
                                        textAlign: TextAlign.center,
                                        work.position!,
                                        context),
                                    const SizedBox(height: 8),
                                    AppTextTheme.xSmall(
                                        textAlign: TextAlign.center,
                                        work.sector!,
                                        context),
                                    const SizedBox(height: 8),
                                    AppTextTheme.xSmall(
                                        textAlign: TextAlign.center,
                                        work.city!,
                                        context),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 210,
                                child: AppTextTheme.xSmall(
                                    work.workDescription!,
                                    fontWeight: FontWeight.normal,
                                    context),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: AppTextTheme.xSmall(
                                "${DateFormatter.dateFormatter.format(work.startDate ?? DateTime.now())} - ${DateFormatter.dateFormatter.format(work.endDate ?? DateTime.now())}",
                                context,
                                fontWeight: FontWeight.normal),
                          ),
                          const Divider(),
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
