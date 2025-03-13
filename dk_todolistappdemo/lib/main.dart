import 'package:flutter/material.dart';
import 'firstview.dart';

void main() {
  runApp(const TodoDemoApp());
}

class TodoDemoApp extends StatelessWidget {
  const TodoDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FirstView());
  }
}
