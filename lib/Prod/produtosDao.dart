import 'package:anuncio/CadProd/DBprod.dart';
import 'package:anuncio/CadProd/Prod.dart';
import 'package:anuncio/Prod/produto.dart';
import 'package:sqflite/sqflite.dart';

class ProdutoAgro {
  Future<List<Prod>> findAll() async {
    DBprod dbHelper = DBprod();
    var db = await dbHelper.initDB();
    String sql = 'SELECT * FROM prod;';
    final resultSet = await db.rawQuery(sql);

    print('$resultSet');

    List<Prod> list = [];
    for (var json in resultSet) {
      Prod produto = Prod.fromJson(json);
      list.add(produto);
    }

    return list;
  }

  salvarProduto({required Prod prod}) async {
    DBprod dbHelper = DBprod();
    Database db = await dbHelper.initDB();
    db.insert('prod', prod.toJson());
    print("Produto salvo com sucesso!");
  }
}
