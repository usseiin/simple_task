import 'package:app/components/auth_button.dart';
import 'package:flutter/material.dart';

import '../color.dart';
import '../linear_progressive_bar.dart';
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
    final isPlural = tasks.isNotEmpty;
    final tasksLength = tasks.length;

    var completedTasks = tasks.map((e) => e.isComplete).length;
    return Container(
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
                ),
              ),
            ),
        ],
      ),
    );
  }
}
