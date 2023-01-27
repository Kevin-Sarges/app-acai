import 'package:app_acai/app/features/login/domain/entity/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.email, required super.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};

    map['email'] = email;
    map['password'] = password;

    return map;
  }
}
