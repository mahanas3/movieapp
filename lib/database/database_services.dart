import 'package:movieapp/model/detailsmodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Db {
  Database? _database;

  Future<Database?> openDB() async {
    _database = await openDatabase(join(await getDatabasesPath(), "path.db"),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE student_table(id INTEGER PRIMARY KEY,title TEXT,posterPath TEXT,backdropPath TEXT)",
      );
    });
    return _database;
  }

  Future insert(Details details) async {
    await openDB();
    return await _database?.insert('details', details.toJson());
  }

  Future<List<Details>> getDetails() async {
    await openDB();
    final List<Map<String, dynamic>> maps = await _database!.query('details');
    return List.generate(maps.length, (index) {
      return Details(
          id: maps[index]['id'],
          title: maps[index]['title'],
          posterPath: maps[index]['backdropPath'],
          backdropPath: maps[index]['backdropPath']);
    });
  }
}
