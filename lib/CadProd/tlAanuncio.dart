import 'dart:io';
import 'package:anuncio/Prod/tlProduto.dart';
import 'package:flutter/material.dart';
import 'package:anuncio/Prod/produtosDao.dart';
import 'package:image_picker/image_picker.dart';
import 'Prod.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final TextEditingController _TituloController = TextEditingController();
  final TextEditingController _DescricaoController = TextEditingController();
  final TextEditingController _PrecoController = TextEditingController();
  final TextEditingController _UrlController = TextEditingController();
  final TextEditingController _TelefoneController = TextEditingController();
  final TextEditingController _CidadeController = TextEditingController();
  final TextEditingController _EstadoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Anúncio"),
          actions: [IconButton(onPressed: null, icon: Icon(Icons.save))],
        ),
        body: SingleChildScrollView( 
          scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: _TituloController,
                decoration: InputDecoration(
                    labelText: 'Título',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _DescricaoController,
                decoration: InputDecoration(
                    labelText: 'Descrição', 
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _TelefoneController,
                decoration: InputDecoration(
                    labelText: 'Telefone',
                    hintText: "(99) 9 9999-9999",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _EstadoController,
                decoration: InputDecoration(
                    labelText: 'Estado', 
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _PrecoController,
                decoration: InputDecoration(
                    labelText: 'Preço',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _UrlController,
                decoration: InputDecoration(
                    labelText: 'Url da imagem',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    final String titulo = _TituloController.text;
                    final String descricao = _DescricaoController.text;
                    final String preco = _PrecoController.text;
                    final String imagem = _UrlController.text;
                    final String telefone = _TelefoneController.text;
                    final String cidade = _CidadeController.text;
                    final String estado = _EstadoController.text;
                    
                    Prod prod = Prod.cadastro(
                      imagem: imagem,
                      nome: titulo,
                      descricao: descricao,
                      preco: preco,
                      telefone: telefone,
                      cidade: cidade,
                      estado: estado,
                    );

                    ProdutoAgro().salvarProduto(prod: prod);
                  },
                  child: Text("Anunciar")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Produtos();
                        },
                      ),
                    );
                  },
                  child: Text("Ver")),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Widget fieldTitulo(TextEditingController _TituloController) {
    return TextFormField(
      controller: _TituloController,
      decoration: InputDecoration(
          labelText: 'Título',
          border: OutlineInputBorder()),
    );
  }

  Widget fielDescricao(TextEditingController _DescricaoController) {
    return TextFormField(
      controller: _DescricaoController,
      decoration: InputDecoration(
          labelText: 'Descrição', 
          border: OutlineInputBorder()),
    );
  }

  Widget fieldTelefone(TextEditingController _TelefoneController) {
    return TextFormField(
      controller: _TelefoneController,
      decoration: InputDecoration(
          labelText: 'Telefone',
          hintText: "(99) 9 9999-9999",
          border: OutlineInputBorder()),
    );
  }

  Widget fieldCidade(TextEditingController _CidadeController) {
    return TextFormField(
      controller: _CidadeController,
      decoration: InputDecoration(
          labelText: 'Cidade',
          border: OutlineInputBorder()),
    );
  }

  Widget fieldEstado() {
    return TextFormField(
      controller: _EstadoController,
      decoration: InputDecoration(
          labelText: 'Estado',
          border: OutlineInputBorder()),
    );
  }

  Widget fieldPreco(TextEditingController _PrecoController) {
    return TextFormField(
      controller: _PrecoController,
      decoration: InputDecoration(
          labelText: 'Preço', 
          border: OutlineInputBorder()),
    );
  }

  Widget fieldUrl(TextEditingController _UrlController) {
    return TextFormField(
      controller: _UrlController,
      decoration: InputDecoration(
            labelText: 'Url da imagem', 
            border: OutlineInputBorder()),
    );
  }
}
