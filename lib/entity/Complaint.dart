import 'BaseEntity.dart';
import 'package:intl/intl.dart';

class Complaint extends BaseEntity {
  String? _category;
  String? _title;
  String? _details;
  String? _createdAt;
  String? _lastUpdatedAt;
  String? _status;
  int _userId;

  Complaint(super._id, this._category, this._title, this._details, this._status,
      this._userId, this._createdAt, this._lastUpdatedAt);

  String? get category => _category;
  String? get title => _title;
  String? get details => _details;
  String? get status => _status;
  int get userId => _userId;
  String? get createdAt => _createdAt;
  String? get lastUpdatedAt => _lastUpdatedAt;

  set setCategory(String category) => _category = category;
  set setTitle(String title) => _title = title;
  set setDetails(String details) => _details = details;
  set setStatus(String status) => _status = status;
  set setUserId(int userId) => _userId = userId;
  set setCreatedAt(String createdAt) => _createdAt = createdAt;
  set setLastUpdatedAt(String lastUpdatedAt) => _lastUpdatedAt = lastUpdatedAt;

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
        json['id'] ?? 0,
        json['category'],
        json['title'],
        json['details'],
        json['status'],
        json['userId'],
        DateFormat('yyyy-MM-dd').format(DateTime.now()),
        DateFormat('yyyy-MM-dd').format(DateTime.now()));
  }

  Map toJson() => {
        'id': super.id,
        'category': _category,
        'title': _title,
        'details': _details,
        'status': _status,
        'userId': _userId,
        'createdAt': _createdAt,
        'lastUpdatedAt': _lastUpdatedAt
      };
}
