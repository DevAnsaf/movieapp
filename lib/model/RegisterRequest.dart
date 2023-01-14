import 'Data.dart';

class RegisterRequest {
  RegisterRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.password
  });

  RegisterRequest.fromJson(dynamic json) {
    firstName = json["fistName"];
    lastName = json["lastName"];
    email = json["email"];
    password = json["password"];
  }

  String? firstName;
  String? lastName;
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["fistName"] = firstName;
    map["lastName"] = lastName;
    map["email"] = email;
    map["password"] = password;
    return map;
  }

}