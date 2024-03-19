import 'package:flutter/material.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( //Scaffold como widget de la pantalla principal
      appBar: AppBar( //AppBar con el Lista de tareas
        title: Text('Lista de Tareas'),
      ),
      body: Center(
        child: Text('Lista de tareas va a ir aquí'),
      ),
    );
  }
}
