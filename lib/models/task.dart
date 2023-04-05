import 'dart:convert';

class Task {
  final String title;
  final String description;
  bool isComplete;
  final DateTime time;
  Task({
    required this.title,
    required this.description,
    this.isComplete = false,
    required this.time,
  });

  Task copyWith({
    String? title,
    String? description,
    bool? isComplete,
    DateTime? time,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      isComplete: isComplete ?? this.isComplete,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'isComplete': isComplete,
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      description: map['description'] as String,
      isComplete: map['isComplete'] as bool,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(title: $title, description: $description, isComplete: $isComplete, time: $time)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.isComplete == isComplete &&
        other.time == time;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        isComplete.hashCode ^
        time.hashCode;
  }
}
