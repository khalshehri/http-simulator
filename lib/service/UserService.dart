import '../entity/User.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import '../repository/RepositoryFacroty.dart';
import '../repository/UserRepository.dart';
import '../utils/SequenceUtil.dart';
import 'BadgeService.dart';
import 'ServiceFactory.dart';
import 'TaskService.dart'; // for the utf8.encode method

class UserService {
  final UserRepository? _userRepository = RepositoryFactory.getUserRepository;
  final TaskService? _taskService = ServiceFactory.getTaskService;
  final BadgeService? _badgeService = ServiceFactory.getBadgeService;

  void register(User user) {
    user.setId = SequenceUtils.nextUserSequence;
    user.setPassword =
        sha256.convert(utf8.encode(user.password ?? "")).toString();
    _userRepository?.save(user);
  }

  User? login(User input) {
    return _userRepository?.login(input.idNumber,
        sha256.convert(utf8.encode(input.password ?? "")).toString());
  }

  User addTaskToUser(User input, int taskId) {
    var user = _userRepository?.findEntityById(input.id) as User;
    var task = _taskService?.findOneById(taskId);
    user.tasks.add(task!);
    user.setPoints = user.points + task.points;
    _userRepository?.updat(user);
    return user;
  }

  User addBadgeToUser(User input, int badgeId) {
    var user = _userRepository?.findEntityById(input.id) as User;
    var badge = _badgeService?.findOneById(badgeId);
    if (badge != null) {
      if (user.points >= badge.points) {
        user.badges.add(badge);
        user.setPoints = user.points - badge.points;
        _userRepository?.updat(user);
      }
    }
    return user;
  }
}
