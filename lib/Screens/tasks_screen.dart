import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/task.dart';
import '../Widgets/add_task_sheet.dart';
import '../Widgets/task_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // addtask(String task) {
  //   setState(
  //     () {
  //       tasks.add(Task(name: task));
  //     },
  //   );
  //   Navigator.pop(context);
  // }

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<TaskManager>(context).tasks;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 27,
          ),
          backgroundColor: Colors.lightBlueAccent,
          onPressed: () {
            showModalBottomSheet(
              shape: CircleBorder(),
              context: context,
              builder: (BuildContext context) {
                return AddTaskSheet();
              },
            );
          }),
      //Color.fromARGB(255, 116, 211, 255)
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      print('Todoey List');
                    },
                    child: Material(
                      shape: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Icon(
                          Icons.list,
                          color: Colors.lightBlueAccent,
                          size: 37,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Todoey",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700),
                  ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  Text(
                    " ${tasks.length} Tasks",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  padding: EdgeInsets.all(20),
                  child: TaskList()),
            )
          ],
        ),
      ),
    );
  }
}
