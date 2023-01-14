class Data {
  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.token,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    token = json['token'];
  }

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['token'] = token;
    return map;
  }
}
