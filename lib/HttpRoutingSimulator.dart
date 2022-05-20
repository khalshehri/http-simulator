import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'web/BadgeRestController.dart';
import 'web/ComplaintRestController.dart';
import 'web/OfferRestController.dart';
import 'web/TaskRestController.dart';
import 'web/UserRestController.dart';

class HttpRoutingSimulator {
  static final String BASE_URL = "http://localhost";
  static final UserRestController _userRestController = UserRestController();
  static final ComplaintRestController _complaintRestController =
      ComplaintRestController();
  static final OfferRestController _offerRestController = OfferRestController();
  static final TaskRestController _taskRestController = TaskRestController();
  static final BadgeRestController _badgeRestController = BadgeRestController();

  /// send HTTP GET request
  ///
  /// first parameter [a] URI is required, when using this method send URL like this Uri.parse(HttpRoutingSimulator.BASE_URL + #endpoint)
  ///
  /// HttpRoutingSimulator.BASE_URL = http://localhost
  ///
  /// if you need to send request body please add to method (body: yourRequest)
  ///
  /// the method will return Response contain body if there and the http status
  static http.Response get(Uri uri,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _call(uri, body: body, method: "GET");
  }

  /// send HTTP POST request
  ///
  /// first parameter [a] URI is required, when using this method send URL like this Uri.parse(HttpRoutingSimulator.BASE_URL + #endpoint)
  ///
  /// HttpRoutingSimulator.BASE_URL = http://localhost
  ///
  /// if you need to send request body please add to method (body: yourRequest)
  ///
  /// the method will return Response contain body if there and the http status
  static http.Response post(Uri uri,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return _call(uri, body: body, method: "POST");
  }

  static http.Response _call(Uri uri,
      {Map<String, String>? headers,
      Object? body,
      Encoding? encoding,
      String? method}) {
    http.Response respnse;
    String jsonRequest = jsonEncode(body);
    switch (uri.path) {
      case "/user/register":
      case "/user/login":
      case "/user/task":
      case "/user/badge":
        respnse = _handleUserEndpoint(uri, jsonRequest);
        break;
      case "/complaints":
        respnse = _handleComplaintsEndpoint(uri, jsonRequest, method!);
        break;

      case "/offers":
        respnse = _handleOfferEndpoint(uri, jsonRequest);
        break;

      case "/tasks":
        respnse = _handleTaskEndpoint(uri, jsonRequest, method!);
        break;

      case "/badges":
        respnse = _handleBadgeEndpoint(uri, jsonRequest, method!);
        break;

      default:
        respnse = new http.Response("", HttpStatus.badRequest);
    }

    return respnse;
  }

  static http.Response _handleUserEndpoint(Uri uri, String jsonRequest) {
    http.Response response;
    try {
      switch (uri.path) {
        case "/user/register":
          response = _userRestController.register(jsonRequest);
          break;
        case "/user/login":
          response = _userRestController.login(jsonRequest);
          break;
        case "/user/task":
          response = _userRestController.addTaskToUser(
              jsonRequest, int.parse(uri.query.replaceAll("taskId=", "")));
          break;
        case "/user/badge":
          response = _userRestController.addBadgeToUser(
              jsonRequest, int.parse(uri.query.replaceAll("id=", "")));
          break;

        default:
          response = http.Response("", HttpStatus.badRequest);
      }
    } catch (e) {
      response = http.Response("", HttpStatus.badRequest);
    }

    return response;
  }

  static http.Response _handleComplaintsEndpoint(
      Uri uri, String jsonRequest, String method) {
    http.Response response = http.Response("", HttpStatus.badRequest);

    if (uri.path == "/complaints") {
      if (method == "GET") {
        response = _complaintRestController
            .findAll(int.parse(uri.query.replaceAll("userId=", "")));
      } else if (method == "POST") {
        response = _complaintRestController.save(jsonRequest);
      }
    } else if (uri.path.startsWith("/complaints/")) {
      response = _complaintRestController
          .findOneById(int.parse(uri.path.replaceAll("/complaints/", "")));
    } else {
      response = http.Response("", HttpStatus.badRequest);
    }

    return response;
  }

  static http.Response _handleOfferEndpoint(Uri uri, String jsonRequest) {
    http.Response response = http.Response("", HttpStatus.badRequest);

    if (uri.path == "/offers") {
      response = _offerRestController.save(jsonRequest);
    } else if (uri.path.startsWith("/offers/")) {
      response =
          _offerRestController.findAll(uri.path.replaceAll("/offers/", ""));
    } else {
      response = http.Response("", HttpStatus.badRequest);
    }

    return response;
  }

  static http.Response _handleTaskEndpoint(
      Uri uri, String jsonRequest, String method) {
    http.Response response = http.Response("", HttpStatus.badRequest);

    if (uri.path == "/tasks") {
      if (method == "GET") {
        response = _taskRestController.findAll();
      } else if (method == "POST") {
        response = _taskRestController.save(jsonRequest);
      }
    } else if (uri.path.startsWith("/tasks/")) {
      response = _taskRestController
          .findOneById(int.parse(uri.path.replaceAll("/tasks/", "")));
    }

    return response;
  }

  static http.Response _handleBadgeEndpoint(
      Uri uri, String jsonRequest, String method) {
    http.Response response = http.Response("", HttpStatus.badRequest);

    if (uri.path == "/badges") {
      if (method == "GET") {
        response = _badgeRestController.findAll();
      } else if (method == "POST") {
        response = _badgeRestController.save(jsonRequest);
      }
    } else if (uri.path.startsWith("/badges/")) {
      response = _badgeRestController
          .findOneById(int.parse(uri.path.replaceAll("/badges/", "")));
    } else {
      response = http.Response("", HttpStatus.badRequest);
    }

    return response;
  }
}
