import 'package:app_acai/app/common/entity/produto_carrinho_entity.dart';
import 'package:app_acai/app/common/error/common_errors.dart';
import 'package:app_acai/app/common/helpers/sqflite_helpers.dart';
import 'package:app_acai/app/common/model/produto_carrinho_model.dart';
import 'package:app_acai/app/common/utils/strings_app.dart';
import 'package:app_acai/app/features/carrinho/domain/datasource/icarrinho_datasource.dart';
import 'package:sqflite/sqlite_api.dart';

class CarrinhoDataSource implements CarrinhoDataSourceImpl {
  late Database db;

  List<ProdutoCarrinhoEntity> produto = [];
  List<ProdutoCarrinhoEntity> get produtoCarrinho => produto;

  @override
  Future<List<ProdutoCarrinhoEntity>> getProdutoCarrinho() async {
    try {
      db = await SqfliteHelpers.instance.database;

      final maps = await db.query(StringsApp.nomeTabela);

      if (maps.isNotEmpty) {
        produto = ProdutoCarrinhoModel.fromJsonList(maps);
      }

      return produto;
    } on DatabaseException catch (e) {
      throw CommonDesconhecidoError(message: e);
    }
  }

  @override
  Future<void> limparCarrinho() async {
    try {
      db = await SqfliteHelpers.instance.database;

      await db.delete(StringsApp.nomeTabela);

      produtoCarrinho.clear();
    } on DatabaseException catch (e) {
      throw CommonDesconhecidoError(message: e);
    }
  }

  @override
  Future<double> somaPreco() async {
    try {
      db = await SqfliteHelpers.instance.database;

      List<Map<String, dynamic>> total = await db.rawQuery(
        'SELECT SUM(${StringsApp.preco}) FROM ${StringsApp.nomeTabela}',
      );

      double precoTotal = total[0]['SUM(${StringsApp.preco})'] ?? 0.0;

      return precoTotal;
    } on DatabaseException catch (e) {
      throw CommonDesconhecidoError(message: e);
    }
  }

  @override
  Future<void> onDeleteProduto(String id) async {
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

  @override
  Future<int> updateQtd(ProdutoCarrinhoModel produto) async {
    try {
      db = await SqfliteHelpers.instance.database;

      final update = await db.update(
        StringsApp.nomeTabela,
        produto.toJson(),
        where: '${StringsApp.id} = ?',
        whereArgs: [produto.id],
      );

      return update;
    } on DatabaseException catch (e) {
      throw CommonDesconhecidoError(message: e);
    }
  }
}
