import 'dart:convert';
import 'dart:io';
import 'package:backend_api/entity/Task.dart';
import 'package:backend_api/service/TaskService.dart';
import 'package:http/http.dart' as http;
import 'package:backend_api/service/ServiceFactory.dart';

class TaskRestController {
  final TaskService? _taskService = ServiceFactory.getTaskService;

  http.Response save(String jsonRequest) {
    _taskService?.save(Task.fromJson(jsonDecode(jsonRequest)));
    return http.Response("", HttpStatus.created);
  }

  http.Response findAll() {
    List<Task>? tasks = _taskService?.findAll();
    return http.Response(jsonEncode(tasks), HttpStatus.ok);
  }

  http.Response findOneById(int taskId) {
    Task? task = _taskService?.findOneById(taskId);
    return http.Response(jsonEncode(task), HttpStatus.ok);
  }
}
