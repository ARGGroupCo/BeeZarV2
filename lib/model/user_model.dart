class UserModel {
  late int? id;
  late String? name;
  late String? email;
  late bool? emailVerifiedAt;
  late String? phone;
  late String? address;
  late String? image;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.image,
    this.emailVerifiedAt,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      address: json["address"],
      emailVerifiedAt: json["email_verified_at"],
      image: json["image"],
    );
  }
}
