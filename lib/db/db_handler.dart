
import 'package:db_note_getx/db/db_helper.dart';
import 'package:db_note_getx/models/model_notes.dart';

class DBHandler{

  DBHelper dbHelper = DBHelper();


  // Future<List<ModelNotes>> getNotesList() async{
  //   var dbClient = await dbHelper.db;
  //   final List<Map<String, Object?>> queryResult = await dbClient!.query('notes');
  //   return queryResult.map((e) => ModelNotes.fromMap(e)).toList();
  // }
  Future<List<ModelNotes>> getNotesList() async {
    var dbClient = await dbHelper.db;
    List<Map<String,dynamic>> maps = await dbClient!.query('notes',columns: ['id','title','date','description']);
    List<ModelNotes> notesList = [];
    for(int i=0 ; i<maps.length; i++){
      notesList.add(ModelNotes.fromMap(maps[i]));
    }
    return notesList;
  }

  Future<int>addNote(ModelNotes modelNotes) async{
    var dbClient = await dbHelper.db;
    return await dbClient!.insert('notes', modelNotes.toMap());
  }

  Future<int> deleteNote(int id) async{
    var dbClient = await dbHelper.db;
    return await dbClient!.delete(
        'notes',
        where: 'id = ?',
        whereArgs: [id]);
  }
  Future<int> updateNote(ModelNotes modelNotes) async{
    var dbClient = await dbHelper.db;
    return await dbClient!.update(
        'notes',
        modelNotes.toMap(),
        where: 'id = ?',
        whereArgs: [modelNotes.id]);
  }

}

