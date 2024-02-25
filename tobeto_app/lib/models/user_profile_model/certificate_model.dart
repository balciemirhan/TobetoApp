import 'dart:io';

class Certificate {
  String certicateName;
  String organisationName;
  File? file;
  Certificate({
    required this.certicateName,
    required this.organisationName,
    this.file,
  });

  Map<String, dynamic> toMap() {
    return {
      'certicateName': certicateName,
      'organisationName': organisationName,
      'file': file?.path,
    };
  }

  factory Certificate.fromMap(Map<String, dynamic> map) {
    return Certificate(
      certicateName: map['certicateName'],
      organisationName: map['organisationName'],
      file: map['file'] != null ? File(map['file']) : null,
    );
  }
}
