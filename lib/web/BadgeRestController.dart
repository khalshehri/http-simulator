import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../entity/Badge.dart';
import '../service/BadgeService.dart';
import '../service/ServiceFactory.dart';

class BadgeRestController {
  final BadgeService? _badgeService = ServiceFactory.getBadgeService;

  http.Response save(String jsonRequest) {
    _badgeService?.save(Badge.fromJson(jsonDecode(jsonRequest)));
    return http.Response("", HttpStatus.created);
  }

  http.Response findAll() {
    List<Badge>? badges = _badgeService?.findAll();
    return http.Response(jsonEncode(badges), HttpStatus.ok);
  }

  http.Response findOneById(int badgeId) {
    Badge? badge = _badgeService?.findOneById(badgeId);
    return http.Response(jsonEncode(badge), HttpStatus.ok);
  }
}
