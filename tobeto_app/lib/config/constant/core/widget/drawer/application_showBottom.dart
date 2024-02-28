import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/drawer/customDilok.dart';
import 'package:tobeto_app/data/application.dart';

PersistentBottomSheetController application(BuildContext context) {
  return showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(applicationList: applicationList);
      });
}
