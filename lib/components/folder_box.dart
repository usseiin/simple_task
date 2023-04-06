import 'package:app/tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:linear_progression_bar/linear_progression_bar.dart';

import 'package:app/components/auth_button.dart';

import '../color.dart';
import '../models/folder.dart';

class FolderBox extends StatelessWidget {
  const FolderBox({
    super.key,
    required this.folder,
  });
  final Folder folder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final tasks = folder.tasks;
    final isPlural = tasks.isNotEmpty && tasks.length > 1;
    final tasksLength = tasks.length;

    var completedTasks = tasks.where((task) => task.isComplete).length;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TasksScreen(
              folder: folder,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(.1, .1),
              blurRadius: .2,
            ),
          ],
          color: faintPurpleBackground,
          borderRadius: customBorder(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              folder.name,
              style: theme.titleMedium,
            ),
            Text(
              "${folder.tasks.length} ${isPlural ? "tasks" : "task"}",
              style: theme.bodySmall,
            ),
            const SizedBox(height: 10),
            if (tasksLength >= 1)
              SizedBox(
                width: 75,
                child: CustomPaint(
                  painter: LinearProgressiveBarPainter(
                    value: completedTasks / tasksLength,
                    backgroundColor: white,
                    foregroundColor: darkColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
