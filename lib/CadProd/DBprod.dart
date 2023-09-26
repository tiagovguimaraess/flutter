import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBprod {
   initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'produto.db'); 

    Database db = await openDatabase(
      dbPath,
      version: 2,
      onCreate: onCreate,
      
    );

    print(dbPath);
    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE prod (id INTEGER PRIMARY KEY AUTOINCREMENT, nome varchar(100), imagem varchar(100), descricao varchar(100), telefone varchar(20), cidade varchar(100), estado varchar(100), preco varchar(100));';
    await db.execute(sql);

    sql =
        "INSERT INTO prod (nome, imagem, descricao, telefone, cidade, estado, preco) VALUES ('Tabaco Plus', 'https://http2.mlstatic.com/D_NQ_NP_808251-MLB44569991046_012021-O.webp', 'SEU TABACO MAIS VERDE E SAUDÁVEL.', '(99) 9 9999-9999', 'Arapiraca', 'Alagoas', '100.00');";
    await db.execute(sql);

  }

}