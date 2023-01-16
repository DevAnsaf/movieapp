import 'UserData.dart';

class UserDataResponse {
  UserDataResponse({
      this.userData, 
      this.status, 
      this.message,});

  UserDataResponse.fromJson(dynamic json) {
    userData = json['data'] != null ? UserData.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }
  UserData? userData;
  int? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userData != null) {
      map['data'] = userData?.toJson();
    }
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}