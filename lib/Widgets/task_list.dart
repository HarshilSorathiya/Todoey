import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/Widgets/task_tile.dart';

import '../Models/task.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    // List<Task> tasks = Provider.of<TaskManager>(context).tasks;

    return Consumer<TaskManager>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onLongPress: () {
                print(
                    '${taskData.tasks[index].name} is removed from Task List');
                taskData.removeTask(taskData.tasks[index]);
              },
              child: TaskTile(
                task: taskData.tasks[index].name,
                checkboxValue: taskData.tasks[index].isDone,
                onChanged: (bool? value) {
                  taskData.updataTask(taskData.tasks[index]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
