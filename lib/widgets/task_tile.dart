import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  TaskTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.name),
    );
  }
}
