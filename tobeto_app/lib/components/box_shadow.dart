import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/theme/theme_manager.dart';

class BoxShadowLogin {
  final BuildContext context;

  BoxShadowLogin(this.context);

  BoxShadow get boxShadowLogin {
    final themeManager = ThemeManager.of(context);

    return BoxShadow(
      blurRadius: 40,
      offset: Offset(15, 15),
      color: themeManager.theme.shadowColor,
    );
  }
}

class BoxShadowLogin2 {
  final BoxShadow boxShadowLogin2 = const BoxShadow(
    blurRadius: 30,
    offset: Offset(-28, -28),
    color: Colors.white,
  );
}
