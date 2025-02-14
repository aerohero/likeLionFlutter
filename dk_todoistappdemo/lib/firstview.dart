import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'todo_model.dart';

class FirstView extends StatefulWidget {
  const FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  final TextEditingController _todoController = TextEditingController();
  List<TodoModel> _todoItem = [];

  @override
  void initState() {
    super.initState();
    _loadTodo();
  }

  void _loadTodo() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    final todoItemJson = sharedPrefs.getStringList('todoItem') ?? [];

    setState(() {
      _todoController.text = sharedPrefs.getString('todo') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration:
                  const InputDecoration(labelText: 'write something to do'),
              controller: _todoController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final SharedPreferences sharedPrefs =
                    await SharedPreferences.getInstance();
                sharedPrefs.setString('todo', _todoController.text);
              },
              child: const Text('save'),
            )
          ],
        ),
      ),
    );
  }
}
