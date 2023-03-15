import 'package:db_note_getx/db/db_handler.dart';
import 'package:db_note_getx/models/model_notes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var notesList = <ModelNotes>[].obs;
  DBHandler dbHandler = DBHandler();

  TextEditingController titleTextController = TextEditingController();
  TextEditingController descTextController = TextEditingController();

  @override
  void onInit() {
    fetchAllNotes();
    super.onInit();
  }


  @override
  void onClose() {
    titleTextController.dispose();
    descTextController.dispose();
  }


  fetchAllNotes() async{
    var notes =await dbHandler.getNotesList() ;
    notesList.value =notes;
}

  addNote(ModelNotes modelNotes) {
    dbHandler.addNote(modelNotes);
    fetchAllNotes();
  }
  updateNote(ModelNotes modelNotes) {
    dbHandler.updateNote(modelNotes);
    fetchAllNotes();
  }
  deleteNote(int id) {
    dbHandler.deleteNote(id);
    fetchAllNotes();
  }
}
