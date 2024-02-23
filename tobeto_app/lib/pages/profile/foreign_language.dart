import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';

import 'package:tobeto_app/pages/profile/personal_widget.dart';

class ForeignLanguage extends StatelessWidget {
  const ForeignLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          final user = state.user;
          return ProfilWidget(
              text: "Yabancı Dillerim",
              widget: user.languageHistory != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: user.languageHistory!.length,
                      itemBuilder: (context, index) {
                        final language = user.languageHistory![index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.language,
                            ),
                            Column(
                              children: [
                                AppTextTheme.small(
                                    language.langName!,
                                    fontWeight: FontWeight.normal,
                                    context),
                                AppTextTheme.xSmall(
                                    language.langLevel!,
                                    fontWeight: FontWeight.normal,
                                    context),
                              ],
                            )
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
