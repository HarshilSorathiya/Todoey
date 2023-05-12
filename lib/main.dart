import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/Models/task.dart';

import 'Screens/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskManager>(
      create: (context) => TaskManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   colorSchemeSeed: const Color(0xff6750a4),
        //   useMaterial3: true,
        // ),
        home: TasksScreen(),
      ),
    );
  }
}
