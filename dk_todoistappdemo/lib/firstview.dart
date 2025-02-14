import 'dart:convert';

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

  // load todoItem from SharedPreferences
  void _loadTodo() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    final todoItemJson = sharedPrefs.getStringList('todoItem') ?? [];

    setState(() {
      _todoItem = todoItemJson
          .map((json) => TodoModel.fromJson(jsonDecode(json)))
          .toList();
    });
  }

  // save todoItem to SharedPreferences
  void _saveTodoItem() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final todoItemJson =
        _todoItem.map((todo) => jsonEncode(todo.toJson())).toList();
    sharedPrefs.setStringList('todoItem', todoItemJson);
  }

  // add a new todoItem
  void _addTodo() {
    if (_todoController.text.isNotEmpty) {
      setState(() {
        _todoItem.add(TodoModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: _todoController.text,
          isCompleted: false,
        ));
        _todoController.clear();
        _saveTodoItem();
      });
    }
  }

  // toggle todoItem completion status
  void _toggleTodo(String id) {
    setState(() {
      final index = _todoItem.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        _todoItem[index] = _todoItem[index].copyWith();
        _saveTodoItem();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),

      body: Column(
        children: [
          // todo Input Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _todoController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: _addTodo,
                          icon: Icon(Icons.add_circle,
                              color: Colors.blue.shade400))),
                  onSubmitted: (_) => _addTodo(),
                ))
              ],
            ),
          )
          Expanded(child: _todoItem.isEmpty)



        ],
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextField(
      //         decoration:
      //             const InputDecoration(labelText: 'write something to do'),
      //         controller: _todoController,
      //       ),
      //       const SizedBox(height: 20),
      //       ElevatedButton(
      //         onPressed: () async {
      //           final SharedPreferences sharedPrefs =
      //               await SharedPreferences.getInstance();
      //           sharedPrefs.setString('todo', _todoController.text);
      //         },
      //         child: const Text('save'),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
