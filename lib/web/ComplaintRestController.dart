import 'dart:convert';
import 'dart:io';
import 'package:backend_api/entity/Complaint.dart';
import 'package:backend_api/service/ComplaintService.dart';
import 'package:http/http.dart' as http;
import 'package:backend_api/service/ServiceFactory.dart';

class ComplaintRestController {
  final ComplaintService? _complaintService =
      ServiceFactory.getComplaintService;

  http.Response save(String jsonRequest) {
    _complaintService?.save(Complaint.fromJson(jsonDecode(jsonRequest)));
    return http.Response("", HttpStatus.created);
  }

  http.Response findAll(int userId) {
    List<Complaint>? complaints = _complaintService?.findAll(userId);
    return http.Response(jsonEncode(complaints), HttpStatus.ok);
  }

  http.Response findOneById(int complaintId) {
    Complaint? complaints = _complaintService?.findOneById(complaintId);
    return http.Response(jsonEncode(complaints), HttpStatus.ok);
  }
}
