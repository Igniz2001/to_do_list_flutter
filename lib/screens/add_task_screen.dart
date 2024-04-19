import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Tarea'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newValue) {
                newTaskTitle = newValue;
              },
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () async {
                if (newTaskTitle.isNotEmpty) {
                  await addTaskToFirestore(newTaskTitle);
                  Navigator.pop(context);
                }
              },
              child: Text('Aceptar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addTaskToFirestore(String taskName) async {
    await FirebaseFirestore.instance.collection('tasks').add({
      'name': taskName,
      'createdAt': Timestamp.now(),
      // Otros campos relevantes de la tarea
    });
  }
}

