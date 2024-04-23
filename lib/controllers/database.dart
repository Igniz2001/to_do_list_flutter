import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list_flutter/models/task.dart';

class TaskController {
  late Task task;

  ///
  FirebaseFirestore db = FirebaseFirestore.instance;

  final String collection = "tasks";

  Future<String> create(Map<String, dynamic> task) async {
    DocumentReference response =
        await db.collection(collection).add(task); //add genera un id
    return response.id;
  }

  TaskController() {
    
  }
  
}