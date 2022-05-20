import 'dart:convert';
import 'dart:io';
import 'package:backend_api/entity/Badge.dart';
import 'package:backend_api/service/BadgeService.dart';
import 'package:http/http.dart' as http;
import 'package:backend_api/service/ServiceFactory.dart';

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
