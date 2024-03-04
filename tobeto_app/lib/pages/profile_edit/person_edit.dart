import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/constant/theme/image.dart';
import 'package:tobeto_app/models/user_model.dart';
import 'package:tobeto_app/pages/profile_edit/edit_dropdownField.dart';
import 'package:tobeto_app/pages/profile_edit/edit_textfield.dart';

class PersonEdit extends StatefulWidget {
  const PersonEdit({Key? key}) : super(key: key);

  @override
  State<PersonEdit> createState() => _PersonEditState();
}

class _PersonEditState extends State<PersonEdit> {
  String? _selectedDropdownItem;
  final ImagePicker _picker = ImagePicker();
  File? _selectedPhoto;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _tcController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  DateTime _dateOfBirth = DateTime.now();
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  bool _isImageSelectionInProgress = false;

  Future pickImage() async {
    if (_isImageSelectionInProgress) {
      return;
    }

    _isImageSelectionInProgress = true;

    final photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        _selectedPhoto = File(photo.path);
      });
    }

    _isImageSelectionInProgress = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileInitial) {}
        if (state is ProfileLoaded) {
          UserModel user = state.user;
          _nameController.text = user.name ?? '';
          _surNameController.text = user.surname ?? '';
          _phoneController.text = user.phone ?? '';
          _dateController.text =
              _dateFormat.format(user.dateOfBirth ?? DateTime.now());
          _tcController.text = user.tcNo ?? '';
          _cityController.text = user.city ?? '';
          _descriptionController.text = user.description ?? '';
          _emailController.text = user.email ?? '';

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          var profileBloc = context.read<ProfileBloc>();

                          UserModel user = UserModel(
                              name: _nameController.text,
                              surname: _surNameController.text,
                              phone: _phoneController.text,
                              dateOfBirth: _dateOfBirth,
                              tcNo: _tcController.text,
                              city: _cityController.text,
                              description: _descriptionController.text,
                              email: _emailController.text);

                          profileBloc.add(
                              UpdateProfile(photo: _selectedPhoto, user: user));

                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.check_circle_rounded,
                          size: 35,
                          color: Colors.deepPurple,
                        )),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: _selectedPhoto != null
                          ? CircleAvatar(
                              radius: 70,
                              backgroundImage: FileImage(_selectedPhoto!),
                            )
                          : user.profilePhoto != null
                              ? CircleAvatar(
                                  radius: 70,
                                  backgroundImage:
                                      NetworkImage(user.profilePhoto!),
                                )
                              : const Image(
                                  image: AssetImage(AppImage.profileImage),
                                ),
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
                EditTextField(
                  label: "Adınız",
                  keyboardType: TextInputType.text,
                  controller: _nameController,
                ),
                EditTextField(
                  label: "Soyadınız",
                  keyboardType: TextInputType.text,
                  controller: _surNameController,
                ),
                EditTextField(
                  label: "Telefon Numaranız",
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                ),
                EditTextField(
                  label: "Doğum Tarihiniz",
                  keyboardType: TextInputType.datetime,
                  controller: _dateController,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1930),
                      initialDate: _dateOfBirth,
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      _dateController.text = _dateFormat.format(pickedDate);
                      _dateOfBirth = pickedDate;
                    }
                  },
                ),
                EditTextField(
                  label: "TC Kimlik No",
                  keyboardType: TextInputType.number,
                  controller: _tcController,
                ),
                EditTextField(
                  label: "E-posta",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                EditDropdownField(
                  text: "Şehir",
                  items: const [
                    DropdownMenuItem(
                        value: "İstanbul", child: Text("İstanbul")),
                    DropdownMenuItem(value: "Ankara", child: Text("Ankara")),
                    DropdownMenuItem(value: "Kocaeli", child: Text("Kocaeli")),
                    DropdownMenuItem(value: "Bursa", child: Text("Bursa")),
                    DropdownMenuItem(value: "Manisa", child: Text("Manisa")),
                    DropdownMenuItem(value: "Bolu", child: Text("Bolu")),
                    DropdownMenuItem(value: "Yalova", child: Text("Yalova")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedDropdownItem = value.toString();
                    });
                  },
                ),
                EditTextField(
                  label: "Hakkımda",
                  keyboardType: TextInputType.text,
                  controller: _descriptionController,
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
