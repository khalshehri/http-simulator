import 'package:backend_api/entity/Task.dart';
import 'package:backend_api/repository/TaskRepository.dart';

import '../repository/RepositoryFacroty.dart';
import '../utils/SequenceUtil.dart';

class TaskService {
  final TaskRepository? _taskRepository = RepositoryFactory.getTaskRepository;

  void save(Task input) {
    input.setId = SequenceUtils.nextTaskSequence;
    _taskRepository?.save(input);
  }

  List<Task>? findAll() {
    return _taskRepository?.findAllEntities().map((e) => e as Task).toList();
  }

  Task findOneById(int taskId) {
    return _taskRepository?.findEntityById(taskId) as Task;
  }
}
