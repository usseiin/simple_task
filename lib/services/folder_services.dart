import 'package:app/models/folder.dart';
import 'package:app/models/task.dart';

abstract class FolderServices {
  void addTask(Folder folder, Task task);

  void addFolder(Folder folder);

  List<Folder> getFolders();

  List<Task> getTasks(Folder folder);
}
