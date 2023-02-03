import 'package:app_acai/app/common/utils/strings_app.dart';

class SqlTables {
  static String get tableCart => '''
    CREATE TABLE ${StringsApp.nomeTabela} (
      ${StringsApp.id} TEXT PRIMARY KEY,
      ${StringsApp.imagem} TEXT NOT NULL,
      ${StringsApp.nome} TEXT NOT NULL,
      ${StringsApp.preco} REAL NOT NULL,
      ${StringsApp.qtd} INTEGER NOT NULL
    )
  ''';
}
