import 'package:app_acai/app/common/error/failure.dart';

abstract class CadastroState {}

class CadastroIntial extends CadastroState {}

class CadastroCarregando extends CadastroState {}

class CadastroSucesso extends CadastroState {}

class CadastroError extends CadastroState {
  Failure erro;

  CadastroError(this.erro);
}
