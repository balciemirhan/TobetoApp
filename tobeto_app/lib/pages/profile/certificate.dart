import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/constant/theme/text_theme.dart';
import 'package:tobeto_app/pages/profile/personal_widget.dart';

class Certificate extends StatelessWidget {
  const Certificate({Key? key}) : super(key: key);

  certificate(BuildContext context, {required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTextTheme.small(text, fontWeight: FontWeight.normal, context),
        const Icon(Icons.picture_as_pdf_outlined),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          final user = state.user;
          return ProfilWidget(
            text: "Sertifikalarım",
            widget: user.certificates != null
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: user.certificates!.length,
                    itemBuilder: (context, index) {
                      final certificates = user.certificates![index];
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(FontAwesomeIcons.building),
                                AppTextTheme.xSmall(
                                    "Sertifika Alınan Kurum: ${certificates.organisationName}",
                                    context)
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(FontAwesomeIcons.scroll),
                                AppTextTheme.xSmall(
                                    "Sertifika Adı: ${certificates.certicateName}",
                                    context)
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Container(),
          );
        }
        return Container();
      },
    );
  }
}
