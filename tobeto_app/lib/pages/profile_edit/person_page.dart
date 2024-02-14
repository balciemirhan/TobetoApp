import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/api/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/config/constant/theme/image.dart';
import 'package:tobeto_app/models/user_model.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedPhoto;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  DateTime _dateOfBirth = DateTime.now();
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  Future pickImage() async {
    final photo = await _picker.pickImage(source: ImageSource.gallery);
    // resmi yüklemek => File türünde olucak.
    // widgetin durmunu güncellemek gerek selectedImage değişkeni değiştirilebilir bir tür olan File nesnesidir.
    //widget'ın durumu güncellenmeyecek ve kullanıcı arayüzü bir resmin seçildiğini yansıtmayacaktır.
    setState(() {
      if (photo != null) {
        _selectedPhoto = File(photo.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileInitial) {
          //  context.read<ProfileBloc>().add(FetchProfileInfo());
        }
        if (state is ProfileLoaded) {
          UserModel user = state.user;
          _nameController.text = user.name ?? '';
          _surNameController.text = user.surname ?? '';
          _phoneController.text = user.phone ?? '';
          _dateController.text =
              _dateFormat.format(user.dateOfBirth ?? DateTime.now());

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
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
                              backgroundImage: NetworkImage(user.profilePhoto!),
                            )
                          : const Image(
                              image: AssetImage(AppImage.profileImage),
                            ),
                ),
                personTextField(
                  label: "Adınız",
                  keyboardType: TextInputType.text,
                  controller: _nameController,
                ),
                personTextField(
                  label: "Soyadınız",
                  keyboardType: TextInputType.text,
                  controller: _surNameController,
                ),
                personTextField(
                  label: "Telefon Numaranız",
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                ),
                personTextField(
                  label: "Doğum Tarihiniz",
                  keyboardType: TextInputType.datetime,
                  controller: _dateController,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1930), // en erken tarihi.
                      initialDate:
                          _dateOfBirth, // Tarihi seçici ilk açıldığında görüntülenen başlangıç noktasıdır.
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      _dateController.text = _dateFormat.format(pickedDate);
                      _dateOfBirth = pickedDate;
                      //_dateFormat dd/MM/yyyy biçiminde ise veriyi alabiliyorum.
                    }
                  },
                ),
                const personTextField(
                  label: "TC Kimlik No",
                  keyboardType: TextInputType.number,
                ),
                const personTextField(
                  label: "E-posta",
                  keyboardType: TextInputType.emailAddress,
                ),
                const personTextField(
                  label: "Ülke",
                ),
                const personTextField(
                  label: "Hakkımda",
                  keyboardType: TextInputType.text,
                ),
                ElevatedButton(
                    onPressed: () {
                      var profileBloc = context.read<ProfileBloc>();

                      UserModel user = UserModel(
                        name: _nameController.text,
                        surname: _surNameController.text,
                        phone: _phoneController.text,
                        dateOfBirth: _dateOfBirth,
                      );

                      profileBloc.add(
                          UpdateProfile(photo: _selectedPhoto, user: user));

                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.upload))
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

class personTextField extends StatelessWidget {
  const personTextField({
    super.key,
    required this.label,
    this.keyboardType,
    this.controller,
    this.onTap,
  });
  final String label;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        keyboardType: keyboardType,
        minLines: 1,
        maxLines: null,
        decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)))),
      ),
    );
  }
}
