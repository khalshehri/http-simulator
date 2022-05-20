import 'dart:convert';

import 'package:http_simulator/entity/Badge.dart';
import 'package:http_simulator/entity/Offer.dart';
import 'package:http_simulator/entity/User.dart';

import 'entity/Complaint.dart';
import 'entity/Task.dart';

void main(List<String> args) {
  Map<String, String> map = {'idNumber': 'tom', 'password': 'pass@123'};

  print("===========================================================");
  print("Map as Json :    ${jsonEncode(map)}");
  print("Map To User :    ${jsonEncode(User.fromJson(map).toJson())}");
  print("===========================================================");

  print("===========================================================");
  Task task = Task(1, "TASK1", 1500, "TASK 1", "TASK 1");
  print("Task as Json :    ${jsonEncode(task.toJson())}");
  print("===========================================================");

  print("===========================================================");
  Badge badge = Badge(1, "BADGE1", 1500, "BADGE1 1", "BADGE1 1");
  print("Badge as Json :    ${jsonEncode(badge.toJson())}");
  print("===========================================================");

  print("===========================================================");
  User user = User(1, "101254654", "P@ssw0rd", "Khalid Alshehri", "2022-10-10",
      "demo@email.com", "96650052154");
  user.badges.add(badge);
  user.tasks.add(task);
  print("User as Json :    ${jsonEncode(user.toJson())}");
  print("===========================================================");

  print("===========================================================");
  Offer offer = Offer(1, "offer", "offer", "offer", "OFFER");
  print("Offer as Json :    ${jsonEncode(offer.toJson())}");
  print("===========================================================");

  print("===========================================================");
  Complaint complaint =
      Complaint(1, "test", "test", "test", "test", 5, "test", "test");
  print("Complaint as Json :    ${jsonEncode(complaint.toJson())}");
  print("===========================================================");
}
