// ignore_for_file: non_constant_identifier_names

class LoginModel {
  bool? Status;
  String? message;
  UserData? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    Status = json['status'];
    message = json['message'];
    data = json['status'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}
