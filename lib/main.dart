import 'package:flutter/material.dart';
import 'package:nsexpresstodolistapp/screens/toDoListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ToDoListScreen(),
    );
  }
}
