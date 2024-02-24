import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/user_model.dart';

class CertificateEdit extends StatefulWidget {
  const CertificateEdit({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CertificateEditState();
}

class _CertificateEditState extends State<CertificateEdit> {
  File? _selectedFile;

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'doc'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  certificate(BuildContext context, {required String text}) {
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
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileInitial || state is ProfileUpdated) {
          context.read<ProfileBloc>().add(GetProfil());
        }
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProfileLoaded) {
          UserModel user = state.user;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => _pickPDF(),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Icon(FontAwesomeIcons.filePdf),
                    ),
                  ),
                  _selectedFile != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Seçilen Dosya: ${_selectedFile!.path}"),
                        )
                      : user.certificates != null
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: user.certificates!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const Icon(FontAwesomeIcons.scroll),
                                  title: Text(user.certificates![index]),
                                  trailing: IconButton(
                                      onPressed: () {
                                        state.user.educationHistory
                                            ?.removeAt(index);
                                        context.read<ProfileBloc>().add(
                                              UpdateProfile(user: state.user),
                                            );
                                      },
                                      icon: const Icon(Icons.delete)),
                                );
                              },
                            )
                          : Container(),
                  /*  NeuBox(
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
                  ), */
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<ProfileBloc>().add(UpdateUserCertificate(
                            file: _selectedFile!,
                            user: UserModel(),
                          ));
                    },
                    icon: const Icon(Icons.upload),
                    label: const Text("Yükle"),
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
