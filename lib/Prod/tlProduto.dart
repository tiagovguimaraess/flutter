import 'package:flutter/material.dart';
import 'package:anuncio/Prod/produtosDao.dart';
import 'package:anuncio/Prod/produto.dart';

import '../CadProd/Prod.dart';

class Produtos extends StatefulWidget {
  const Produtos({Key? key}) : super(key: key);

  @override
  State<Produtos> createState() => ProdutosState();
}

class ProdutosState extends State<Produtos> {
  Future<List<Prod>> listaAdubo = ProdutoAgro().findAll();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: FutureBuilder<List<Prod>>(
          future: listaAdubo,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              child:
                                  Image.network(snapshot.data![index].imagem),
                              width: 150,
                              height: 150,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(snapshot.data![index].nome,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Center(
                            child: Flexible(
                              child: Text(snapshot.data![index].descricao,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                           Center(
                            child: Text(snapshot.data![index].preco.toString() + "\$",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                           ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              onPressed: () {},
                              child: Text("COMPRAR")),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("Erro ao carregar");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
