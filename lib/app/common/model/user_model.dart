import 'package:app_acai/app/common/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
