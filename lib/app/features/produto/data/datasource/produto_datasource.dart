import 'package:app_acai/app/common/error/common_errors.dart';
import 'package:app_acai/app/common/helpers/sqflite_helpers.dart';
import 'package:app_acai/app/common/model/produto_carrinho_model.dart';
import 'package:app_acai/app/common/utils/strings_app.dart';
import 'package:app_acai/app/features/produto/domain/datasource/iproduto_datasource.dart';
import 'package:sqflite/sqflite.dart';

class ProdutoDataSource implements ProdutoDataSourceImpl {
  late Database db;

  @override
  Future<void> addProdutoCarrinho(ProdutoCarrinhoModel product) async {
    try {
      db = await SqfliteHelpers.instance.database;

      await db.insert(
        StringsApp.nomeTabela,
        product.toJson(),
      );
    } on DatabaseException catch (e) {
      throw CommonDesconhecidoError(message: e);
    }
  }

  @override
  Future<void> onDelete(String id) async {
    try {
      db = await SqfliteHelpers.instance.database;

      await db.delete(
        StringsApp.nomeTabela,
        where: '${StringsApp.id} = ?',
        whereArgs: [id],
      );
    } on DatabaseException catch (e) {
      throw CommonDesconhecidoError(message: e);
    }
  }
}
