class RegisterUserModel {
  late String? name;
  late String? email;
  late String? phone;
  late String? password;

  RegisterUserModel({this.email, this.name, this.phone, this.password});

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
      };
}
