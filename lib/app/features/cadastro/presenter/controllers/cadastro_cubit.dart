import 'package:app_acai/app/common/model/user_model.dart';
import 'package:app_acai/app/features/cadastro/domain/usecase/cadastro_usecase.dart';
import 'package:app_acai/app/features/cadastro/presenter/controllers/cadastro_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CadastroCubit extends Cubit<CadastroState> {
  CadastroCubit({required this.cadastroUsecase}) : super(CadastroIntial());

  final CadastroUsecase cadastroUsecase;

  Future<void> cadastro(UserModel user) async {
    emit(CadastroCarregando());

    final result = await cadastroUsecase(user);

    emit(result.fold(
      (erro) => CadastroError(erro),
      (_) => CadastroSucesso(),
    ));
  }
}
