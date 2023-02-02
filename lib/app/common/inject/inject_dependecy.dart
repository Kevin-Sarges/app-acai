import 'package:app_acai/app/features/cadastro/domain/inject/cadastro_inject.dart';
import 'package:app_acai/app/features/lista_produtos/domain/inject/lista_produtos_inject.dart';
import 'package:app_acai/app/features/login/domain/inject/login_inject.dart';
import 'package:app_acai/app/features/produto/domain/inject/produto_inject.dart';
import 'package:app_acai/app/features/splash/domain/inject/splash_inject.dart';
import 'package:get_it/get_it.dart';

class InjectDependency {
  static void init() {
    final getIt = GetIt.instance;

    SplashInjectDependency.init(getIt);
    LoginInjectDependency.init(getIt);
    CadastroInjectDependency.init(getIt);
    ListaProdutosInjectDependency.init(getIt);
    ProdutoInjectDependency.init(getIt);
  }
}
