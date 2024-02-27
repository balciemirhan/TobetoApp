import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_file/open_file.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/config/constant/theme/text_theme.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/models/user_profile_model/certificate_model.dart';
import 'package:tobeto_app/pages/profile_edit/edit_button.dart';
import 'package:tobeto_app/pages/profile_edit/edit_textfield.dart';

class CertificateEdit extends StatefulWidget {
  const CertificateEdit({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CertificateEditState();
}

class _CertificateEditState extends State<CertificateEdit> {
  File? _selectedFile;
  final TextEditingController _certificaNameController =
      TextEditingController();
  final TextEditingController __organisationNameController =
      TextEditingController();
  bool _isFolderSelectionInProgress = false;
  Future<void> _pickPDF() async {
    if (_isFolderSelectionInProgress) {
      return;
    }
    _isFolderSelectionInProgress = true;

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'doc'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
    _isFolderSelectionInProgress = false;
  }

  Future openFile({required String url, String? fileName}) async {
    //final name = fileName ?? url.split('/').last;
    final file = await pickFile();
    if (file == null) return;
    OpenFile.open(file.path);
  }

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return null;
    {
      return File(result.files.first.path!);
    }
  }

  _certificateCard(
    BuildContext context, {
    required String organisationName,
    required String certificaName,
    required void Function()? onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
            colors: [Colors.deepPurple.shade300, Colors.deepPurple.shade100],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft),
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                AppTextTheme.small(
                    organisationName, fontWeight: FontWeight.normal, context),
                AppTextTheme.small(
                    certificaName, fontWeight: FontWeight.normal, context),
              ],
            ),
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.delete_rounded,
                color: Colors.deepPurple.shade900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileInitial || state is ProfileUpdated) {
          //context.read<ProfileBloc>().add(GetProfil());
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
                  EditTextField(
                    label: "Kurumun Adı",
                    keyboardType: TextInputType.text,
                    controller: __organisationNameController,
                  ),
                  EditTextField(
                    label: "Sertifika Adı",
                    keyboardType: TextInputType.text,
                    controller: _certificaNameController,
                  ),
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
                  user.certificates != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: user.certificates!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(FontAwesomeIcons.scroll),
                              title: Column(children: [
                                Text(
                                  user.certificates![index].organisationName,
                                ),
                                const SizedBox(width: 10),
                                Text(user.certificates![index].certicateName),
                                const SizedBox(width: 10),
                                _selectedFile != null
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            openFile(url: _selectedFile!.path);
                                          },
                                          child: Text(
                                              " Dosya: ${_selectedFile!.hashCode}"),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          openFile(
                                              url: user
                                                  .certificates![index].file
                                                  .toString());
                                        },
                                        child: Text(
                                            " Dosya: ${user.certificates![index].file?.hashCode}"),
                                      ),
                              ]),
                              trailing: IconButton(
                                  onPressed: () {
                                    state.user.certificates?.removeAt(index);
                                    context.read<ProfileBloc>().add(
                                          UpdateProfile(user: state.user),
                                        );
                                  },
                                  icon: const Icon(Icons.delete)),
                            );
                          },
                        )
                      : Container(),
                  EditButton(
                    text: "Sertifika Ekle",
                    onTap: () {
                      if (state.user.certificates != null) {
                        state.user.certificates!.add(
                          Certificate(
                              certicateName: _certificaNameController.text,
                              organisationName:
                                  __organisationNameController.text,
                              file: _selectedFile),
                        );
                      } else {
                        state.user.certificates = List.of(
                          [
                            Certificate(
                                certicateName: _certificaNameController.text,
                                organisationName:
                                    __organisationNameController.text,
                                file: _selectedFile),
                          ],
                        );
                      }
                      context.read<ProfileBloc>().add(UpdateUserCertificate(
                          user: state.user, file: _selectedFile));
                    },
                  ),
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
