import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../entity/User.dart';
import '../service/ServiceFactory.dart';
import '../service/UserService.dart';

class UserRestController {
  final UserService? _userService = ServiceFactory.getUserService;

  http.Response register(String jsonRequest) {
    _userService?.register(User.fromJson(jsonDecode(jsonRequest)));
    return http.Response("", HttpStatus.created);
  }

  http.Response login(String jsonRequest) {
    User? user = _userService?.login(User.fromJson(jsonDecode(jsonRequest)));
    return http.Response(jsonEncode(user), HttpStatus.ok);
  }

  http.Response addTaskToUser(String jsonRequest, int taskId) {
    User? user = _userService?.addTaskToUser(
        User.fromJson(jsonDecode(jsonRequest)), taskId);
    return http.Response(jsonEncode(user), HttpStatus.ok);
  }

  http.Response addBadgeToUser(String jsonRequest, int badgeId) {
    User? user = _userService?.addBadgeToUser(
        User.fromJson(jsonDecode(jsonRequest)), badgeId);
    return http.Response(jsonEncode(user), HttpStatus.ok);
  }
}
