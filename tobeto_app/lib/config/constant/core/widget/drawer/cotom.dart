import 'package:flutter/material.dart';
import 'package:tobeto_app/models/application_model.dart';

class CustomDialog extends StatelessWidget {
  final List<Application> applicationList;

  const CustomDialog({
    Key? key,
    required this.applicationList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
          Colors.blueGrey, // Arka plan rengini burada değiştirebilirsiniz
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: applicationList.map((application) {
          return ListTile(
            title: Text(application.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(application.subtitle),
                Text(application.subtitle1),
                Text(application.state)
              ],
            ),
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Dialog kapatma
          },
          child: Text('Kapat'),
        ),
      ],
    );
  }
}
