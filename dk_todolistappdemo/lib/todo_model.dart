// import 'package:flutter/material.dart';

class TodoModel {
  final String id;
  final String title;
  final bool isCompleted;

  TodoModel({required this.id, required this.title, required this.isCompleted});

  // create a copy of the todo with optional modifications
  TodoModel copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return TodoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        isCompleted: isCompleted ?? this.isCompleted);
  }

  // JSON serialization methods
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isCompleted': isCompleted,
      };

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
      id: json['id'], title: json['title'], isCompleted: json['isCompleted']);
}
