class Task {
  //Esto será el elemento de la tarea y tendrá un nombre y el estado de terminado o no
  String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
