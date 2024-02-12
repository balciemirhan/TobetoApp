import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tobeto_app/business_logic/blocs/profile_bloc/profile_bloc.dart';
import 'package:tobeto_app/business_logic/blocs/profile_bloc/profile_event.dart';
import 'package:tobeto_app/business_logic/blocs/profile_bloc/profile_state.dart';
import 'package:tobeto_app/models/user_model.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController surnNameController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    DateTime dateOfBirth = DateTime.now();
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileInitial) {
          context.read<ProfileBloc>().add(FetchProfileInfo());
        }
        if (state is ProfileInfoFetched) {
          UserModel user = state.user;
          nameController.text = user.name ?? '';
          surnNameController.text = user.surname ?? '';
          phoneController.text = user.phone ?? '';
          dateController.text =
              dateFormat.format(user.dateOfBirth ?? DateTime.now());
        }
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              personTextField(
                label: "Adınız",
                keyboardType: TextInputType.text,
                controller: nameController,
              ),
              personTextField(
                label: "Soyadınız",
                keyboardType: TextInputType.text,
                controller: surnNameController,
              ),
              personTextField(
                label: "Telefon Numaranız",
                keyboardType: TextInputType.phone,
                controller: phoneController,
              ),
              personTextField(
                label: "Doğum Tarihiniz",
                keyboardType: TextInputType.datetime,
                controller: dateController,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1930), // en erken tarihi.
                    initialDate:
                        dateOfBirth, // Tarihi seçici ilk açıldığında görüntülenen başlangıç noktasıdır.
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    dateController.text = dateFormat.format(pickedDate);
                    dateOfBirth = pickedDate;
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
                label: "İl",
              ),
              const personTextField(
                label: "İlçe",
              ),
              const personTextField(
                label: "Mahalle/Sokak",
              ),
              const personTextField(
                label: "Hakkımda",
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<ProfileBloc>().add(UpdateProfile(
                          user: UserModel(
                              name: nameController.text,
                              surname: surnNameController.text,
                              phone: phoneController.text,
                              dateOfBirth: dateOfBirth),
                        ));
                  },
                  child: const Icon(Icons.upload))
            ],
          ),
        );
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
