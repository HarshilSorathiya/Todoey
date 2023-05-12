import 'dart:collection';

import 'package:flutter/material.dart';

class Task {
  final String name;
  bool? isDone;

  Task({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone!;
  }
}

class TaskManager extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Read the Book'),
    Task(name: 'Buy a Groccery'),
    Task(name: 'Play Ragnarock')
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addtask(String task) {
    _tasks.add(Task(name: task));
    notifyListeners();
  }

  void updataTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
