class ProdutoCarrinhoEntity {
  String id;
  String imagem;
  String nome;
  int qtd;
  double preco;

  ProdutoCarrinhoEntity({
    required this.id,
    required this.nome,
    required this.imagem,
    required this.qtd,
    required this.preco,
  });
}
