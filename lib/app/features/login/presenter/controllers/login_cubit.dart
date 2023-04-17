import 'package:app_acai/app/common/model/user_model.dart';
import 'package:app_acai/app/features/login/domain/usecases/login_email_senha_usecase.dart';
import 'package:app_acai/app/features/login/domain/usecases/login_facebook_usecase.dart';
import 'package:app_acai/app/features/login/domain/usecases/login_google_usecase.dart';
import 'package:app_acai/app/features/login/presenter/controllers/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.loginEmailSenha,
    required this.loginFacebook,
    required this.loginGoogle,
  }) : super(LoginIntial());

  final LoginEmailSenhaUseCase loginEmailSenha;
  final LoginFacebookUseCase loginFacebook;
  final LoginGoogleUseCase loginGoogle;

  Future<void> singInEmailSenha(UserModel user) async {
    emit(LoginCarregando());

    final result = await loginEmailSenha(user);

    emit(result.fold(
      (l) => LoginFalhou(l),
      (_) => LoginSucesso(),
    ));
  }

  Future<void> singInGoogle() async {
    emit(LoginCarregando());

    final result = await loginGoogle();

    emit(result.fold(
      (l) => LoginFalhou(l),
      (_) => LoginSucesso(),
    ));
  }

  Future<void> singInFacebook() async {
    emit(LoginCarregando());

    final result = await loginFacebook();

    emit(result.fold(
      (l) => LoginFalhou(l),
      (_) => LoginSucesso(),
    ));
  }
}
