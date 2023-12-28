import 'package:flutter/material.dart';

class BoxShadowLogin {
  final BuildContext context;

  BoxShadowLogin(this.context);

  BoxShadow get boxShadowLogin {
    return BoxShadow(
        blurRadius: 40, offset: Offset(15, 15), color: Colors.black);
  }
}

class BoxShadowLogin2 {
  final BoxShadow boxShadowLogin2 = const BoxShadow(
    blurRadius: 30,
    offset: Offset(-28, -28),
    color: Colors.white,
  );
}
