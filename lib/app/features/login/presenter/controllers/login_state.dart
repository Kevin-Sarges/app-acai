import 'package:app_acai/app/common/error/failure.dart';

abstract class LoginState {}

class LoginIntial extends LoginState {}

class LoginCarregando extends LoginState {}

class LoginSucesso extends LoginState {}

class LoginFalhou extends LoginState {
  Failure text;

  LoginFalhou(this.text);
}
