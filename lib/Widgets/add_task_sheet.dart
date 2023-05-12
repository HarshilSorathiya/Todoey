import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/task.dart';
import '../constant.dart';

class AddTaskSheet extends StatelessWidget {
  late String task;

  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<TaskManager>(context).tasks;

    return Container(
      padding: EdgeInsets.all(40),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'Add Task',
              style: TextStyle(
                color: primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextField(
            autofocus: true,
            onChanged: (value) {
              task = value;
            },
            decoration: InputDecoration(
                focusColor: primaryColor, fillColor: primaryColor),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  backgroundColor: primaryColor,
                  elevation: 3),
              onPressed: () {
                Provider.of<TaskManager>(context, listen: false).addtask(task);
                Navigator.pop(context);
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ))
        ],
      ),
    );
  }
}
