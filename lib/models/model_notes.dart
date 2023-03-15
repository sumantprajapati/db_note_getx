import 'package:flutter/material.dart';
class ModelNotes{
  final int? id;
  final String title;
  final String date;
  final String description;


  ModelNotes({this.id, required this.title,required this.date,required this.description});

  ModelNotes.fromMap(Map<String, dynamic> res):
  id = res['id'],
  title = res['title'],
  date = res['date'],
  description = res['description'];

  Map<String, Object?> toMap(){
    return{
          'id' : id,
          'title' : title,
          'date' : date,
          'description' : description,
    };
  }

}