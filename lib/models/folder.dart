// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';

import 'task.dart';

class Folder {
  final String id;
  final String name;
  final List<Task> tasks;
  Folder({
    required this.id,
    required this.name,
    required this.tasks,
  });

  Folder copyWith({
    String? name,
    List<Task>? tasks,
  }) {
    return Folder(
      id: name ?? this.name,
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
      id: map["id"] as String,
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
  String toString() => 'Folder(id: $id, name: $name, tasks: $tasks)';

  @override
  bool operator ==(covariant Folder other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ tasks.hashCode;
}

var folders = List.generate(
  4,
  (index) {
    final tasks = Random().nextInt(8);
    return Folder(
      id: "$index",
      name: "Folder $index",
      tasks: List.generate(
        tasks,
        (index) {
          return Task(
            title: "task $index",
            description: "description $index",
            time: DateTime.now(),
            isComplete: Random().nextInt(2) == 1 ? false : true,
          );
        },
      ),
    );
  },
);
