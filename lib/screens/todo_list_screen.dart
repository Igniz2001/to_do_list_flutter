import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list_flutter/models/task.dart';
import 'package:to_do_list_flutter/widgets/task_tile.dart';
import 'package:to_do_list_flutter/screens/add_task_screen.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late Stream<QuerySnapshot> _taskStream;

  @override
  void initState() {
    super.initState();
    _taskStream = FirebaseFirestore.instance.collection('tasks').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: StreamBuilder(
        stream: _taskStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final tasks = snapshot.data!.docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;
              return Task(
                name: data['name'] ?? '',
                isDone: data['isDone'] ?? false,
              );
            }).toList();
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return TaskTile(
                  task: task,
                  onChanged: (value) {
                    // Actualiza el estado de la tarea en Firebase Firestore
                    doc.reference.update({'isDone': value});
                  },
                  onDelete: () {
                    // Elimina la tarea de Firebase Firestore
                    doc.reference.delete();
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        tooltip: 'Agregar Tarea',
        child: Icon(Icons.add),
      ),
    );
  }
}


