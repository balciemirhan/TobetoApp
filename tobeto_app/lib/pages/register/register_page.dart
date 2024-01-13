import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/text.dart';
import 'package:tobeto_app/pages/register/register_form.dart';
import 'package:tobeto_app/widget/now_bottom.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key, this.onTap}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: mediaQuery.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              /* ----------------------- Image / Decore -----------------------  */
              Positioned(
                top: 0,
                left: 0,
                child: Image(
                  width: mediaQuery.width * 1.1,
                  image:
                      const AssetImage("assets/images/register_decor_top.gif"),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image(
                  width: mediaQuery.width * 1.1,
                  image: const AssetImage(
                      "assets/images/register_decor_bottom.png"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image(
                      width: mediaQuery.width * .68,
                      image: const AssetImage("assets/images/cat_profile.png"),
                    ),
                  ),

                  /* ----------------------- Register Form -----------------------  */

                  RegisterForm(formKey: formKey),

                  /* ----------------------- Register Now -----------------------  */

                  Padding(
                    padding: EdgeInsets.only(top: mediaQuery.height / 15),
                    child: NowBottom(
                      text: already,
                      text2: loginNow,
                      onTap: () => onTap!(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
