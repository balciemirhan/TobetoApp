class UserModel {
  String? userId; // doc.set => id'yi alır.
  String? name;
  String? surname;
  String? description;
  String? github;
  String? instagram;
  String? linkedin;
  String? email;
  String? phone;
  String? profilePhoto;

  UserModel({
    this.name,
    this.surname,
    this.description,
    this.github,
    this.instagram,
    this.linkedin,
    this.profilePhoto,
    this.userId,
    this.email,
    this.phone,
  });
// -------------------------------------------------

// ------------------------- (firestore bilgi çekme:) -------------------------
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? "",
      email: map['email'] ?? "",
      phone: map['phone'] ?? "",
      name: map['name'] ?? "",
      surname: map['surname'] ?? "",
      description: map['description'] ?? "",
      github: map['github'] ?? "",
      instagram: map['instagram'] ?? "",
      linkedin: map['linkedin'] ?? "",
      profilePhoto: map['profilePhoto'] ?? "",
    );
  }
// ------------------------- (firestore bilgi gönderme:) -------------------------
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'phone': phone,
      'name': name,
      'surname': surname,
      'description': description,
      'github': github,
      'instagram': instagram,
      'linkedin': linkedin,
      'profilePhoto': profilePhoto,
    };
  }
}









//modellemeye ne gerek var???
// ---> profesyonellik

// ---> veri alışverilerinde kullanmak için modelleme ye ihtiyaç duyuyorum.
// (firebase database)  Map<String,dynamic>


// toMap ---> dartı  nesneden haritaya çevir. firebase aktar.   Map<String,dynamic>



// fromMap ---> verilerimi çek haritadan UserModel nesnesi'ne çevir.



