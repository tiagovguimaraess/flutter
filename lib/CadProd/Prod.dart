class Prod {
  late int id;
  late String nome;
  late String imagem;
  late String descricao;
  late String preco;
  late String telefone;
  late String cidade;
  late String estado;

  Prod({required id, required this.nome, required this.descricao, required this.preco, required this.imagem, required this.telefone, required this.cidade, required this.estado});

  Prod.cadastro({required this.nome, required this.imagem, required this.descricao, required this.preco, required this.telefone, required this.cidade, required this.estado});

  Prod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    imagem = json['imagem'];
    descricao = json['descricao'];
    preco = json['preco'];
    telefone = json['telefone'];
    cidade = json['cidade'];
    estado = json['estado'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['imagem'] = imagem;
    data['nome'] = nome;
    data['descricao'] = descricao;
    data['preco'] = preco;
    data['telefone'] = telefone;
    data['cidade'] = cidade;
    data['estado'] = estado;
    return data;
  }

}