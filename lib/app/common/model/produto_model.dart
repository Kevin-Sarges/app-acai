import 'package:app_acai/app/common/entity/produto_entity.dart';

class ProdutoModel extends ProdutoEntity {
  ProdutoModel({
    required super.descricao,
    required super.nome,
    required super.imagem,
    required super.preco,
  });

  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      descricao: json['descricao'] as String,
      nome: json['nome'] as String,
      imagem: json['imagem'] as String,
      preco: json['preco'] as String,
    );
  }
}
