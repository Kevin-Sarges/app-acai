import 'package:app_acai/app/features/lista_produtos/domain/usecase/user_sign_out_usecase.dart';
import 'package:app_acai/app/features/lista_produtos/presenter/controllers/lista_produtos_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListaProdutosCubit extends Cubit<ListaProdutosState> {
  ListaProdutosCubit({required this.userSignOutUseCase})
      : super(ListaProdutosIntial());

  final UserSignOutUseCase userSignOutUseCase;

  Future<void> userSignOut() async {
    emit(ListaProdutosCarregando());

    final result = await userSignOutUseCase();

    emit(result.fold(
      (_) => ListaProdutosErro(),
      (_) => ListaProdutosSignOut(),
    ));
  }
}
