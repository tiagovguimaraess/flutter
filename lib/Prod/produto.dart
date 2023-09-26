class produto{
  late int id;
  late String nome;
  late String imagem;
  late String descricao;
  late double preco;
  late String telefone;
  late String cidade;
  late String estado;

  produto({
    required this.id,
    required this.nome,
    required this.imagem,
    required this.descricao, 
    required this.preco,
    required this.telefone,
    required this.cidade,
    required this.estado,
  });

  produto.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    imagem = json['imagem'];
    descricao = json['descricao'];
    preco = json['preco'];
    telefone = json['telefone'];
    cidade = json['cidade'];
    estado = json['estado'];
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = nome;
    data['descricao'] = descricao;
    data['preco'] = preco;
    data['telefone'] = telefone;
    data['cidade'] = cidade;
    data['estado'] = estado;
    return data;
   }  

}

