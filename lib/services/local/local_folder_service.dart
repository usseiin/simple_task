import 'package:app/models/task.dart';

import '../../models/folder.dart';
import '../folder_services.dart';

class LocalFolderServices extends FolderServices {
  late List<Folder> _folder;

  LocalFolderServices() {
    // TODO: add folder to _folder
  }

  @override
  void addFolder(Folder folder) {
    // TODO: implement addFolder
  }

  @override
  void addTask(Folder folder, Task task) {
    // TODO: implement addTask
  }

  @override
  List<Folder> getFolders() {
    // TODO: implement getFolders
    throw UnimplementedError();
  }

  @override
  List<Task> getTasks(Folder folder) {
    // TODO: implement getTasks
    throw UnimplementedError();
  }
}
