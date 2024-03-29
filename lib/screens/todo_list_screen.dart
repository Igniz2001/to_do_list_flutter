import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/models/task.dart';
import 'package:to_do_list_flutter/widgets/task_tile.dart';
import 'package:to_do_list_flutter/screens/add_task_screen.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskTile(
            task: task,
            onChanged: (value) {
              setState(() {
                task.toggleDone();
              });
            },
            onDelete: () {
              setState(() {
                tasks.remove(task);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTaskTitle = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          if (newTaskTitle != null) {
            setState(() {
              tasks.add(Task(name: newTaskTitle));
            });
          }
        },
        tooltip: 'Agregar Tarea',
        child: Icon(Icons.add),
      ),
    );
  }
}

