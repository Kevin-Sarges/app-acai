import 'package:app_acai/app/common/entity/produto_carrinho_entity.dart';

class ProdutoCarrinhoModel extends ProdutoCarrinhoEntity {
  ProdutoCarrinhoModel({
    required super.id,
    required super.nome,
    required super.imagem,
    required super.qtd,
    required super.preco,
  });

  factory ProdutoCarrinhoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoCarrinhoModel(
      id: json['id'] as String,
      nome: json['nome'] as String,
      imagem: json['imagem'] as String,
      qtd: json['qtd'] as int,
      preco: json['preco'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};

    map['id'] = id;
    map['nome'] = nome;
    map['imagem'] = imagem;
    map['qtd'] = qtd;
    map['preco'] = preco;

    return map;
  }

  static List<ProdutoCarrinhoEntity> fromJsonList(List list) {
    return list.map((map) => ProdutoCarrinhoModel.fromJson(map)).toList();
  }
}
