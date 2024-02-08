import 'package:flutter/material.dart';
import 'package:tobeto_app/config/constant/core/widget/auth_button.dart';
import 'package:tobeto_app/config/constant/core/widget/neu_box.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';

class CertificatePage extends StatefulWidget {
  const CertificatePage({Key? key}) : super(key: key);

  @override
  _CertificatePageState createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  _certificate(BuildContext context, {required String text}) {
    return DataRow(
      cells: [
        DataCell(AppTextTheme.xSmall(
          text,
          fontWeight: FontWeight.normal,
          context,
        )),
        const DataCell(Icon(Icons.picture_as_pdf)),
        const DataCell(Text("21.09.2023")),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.save_alt,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_rounded,
                color: Colors.red,
              ),
            ),
          ],
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Ekle"),
        ),
        NeuBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: DataTable(
            columnSpacing: 20,
            columns: [
              DataColumn(
                label: AppTextTheme.xSmall(
                  "Dosya Adı",
                  context,
                ),
              ),
              DataColumn(
                label: AppTextTheme.xSmall(
                  "Türü",
                  context,
                ),
              ),
              DataColumn(
                label: AppTextTheme.xSmall(
                  "Tarih",
                  context,
                ),
              ),
              DataColumn(
                label: AppTextTheme.xSmall(
                  "İşlem",
                  context,
                ),
              ),
            ],
            rows: [
              _certificate(context, text: "Aktif Öğrenme"),
              _certificate(context, text: "SQL"),
              _certificate(context, text: "Javascript"),
            ],
          ),
        ),
      ],
    );
  }
}
