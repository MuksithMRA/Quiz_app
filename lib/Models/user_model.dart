import 'dart:convert';

class UserModel {
  String firstName;
  String lastName;
  String email;
  String uid;
  String password;
  UserModel({
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.uid = "",
    this.password = "",
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] ?? "",
      lastName: map['lastName'] ?? "",
      email: map['email'] ?? "",
      uid: map['uid'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
