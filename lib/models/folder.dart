// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';

import 'task.dart';

class Folder {
  final String name;
  final List<Task> tasks;
  Folder({
    required this.name,
    required this.tasks,
  });

  Folder copyWith({
    String? name,
    List<Task>? tasks,
  }) {
    return Folder(
      name: name ?? this.name,
      tasks: tasks ?? this.tasks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'tasks': tasks.map((x) => x.toMap()).toList(),
    };
  }

  factory Folder.fromMap(Map<String, dynamic> map) {
    return Folder(
      name: map['name'] as String,
      tasks: List<Task>.from(
        (map['tasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Folder.fromJson(String source) =>
      Folder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Folder(name: $name, tasks: $tasks)';

  @override
  bool operator ==(covariant Folder other) {
    if (identical(this, other)) return true;

    return other.name == name && listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => name.hashCode ^ tasks.hashCode;
}

var folders = List.generate(
  4,
  (index) {
    final tasks = Random().nextInt(8);
    return Folder(
      name: "Folder $index",
      tasks: List.generate(
        tasks,
        (index) => Task(
          title: "task $index",
          description: "description $index",
          time: DateTime.now(),
          isComplete: Random().nextBool(),
        ),
      ),
    );
  },
);
