// ignore: file_names
import 'Badge.dart';
import 'BaseEntity.dart';

import 'Task.dart';

class User extends BaseEntity {
  String? _idNumber;
  String? _password;
  String? _fullName;
  String? _dateOfBirth;
  String? _email;
  String? _mobile;
  int _points = 0;
  List<Badge> _badges = List.empty(growable: true);
  List<Task> _tasks = List.empty(growable: true);

  User(super._id, this._idNumber, this._password, this._fullName,
      this._dateOfBirth, this._email, this._mobile);

  String? get idNumber => _idNumber;
  String? get password => _password;
  String? get fullName => _fullName;
  String? get dateOfBirth => _dateOfBirth;
  String? get email => _email;
  String? get mobile => _mobile;
  int get points => _points;
  List<Badge> get badges => _badges;
  List<Task> get tasks => _tasks;

  set setIdNumber(String idNumber) => _idNumber = idNumber;
  set setPassword(String password) => _password = password;
  set setFullName(String fullName) => _fullName = fullName;
  set setdDateOfBirth(String dateOfBirth) => _dateOfBirth = dateOfBirth;
  set setEmail(String email) => _email = email;
  set setMobile(String mobile) => _mobile = mobile;
  set setPoints(int points) => _points = points;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['id'] ?? 0, json['idNumber'], json['password'],
        json['fullName'], json['dateOfBirth'], json['email'], json['mobile']);
  }

  Map toJson() => {
        'id': super.id,
        'idNumber': _idNumber,
        'fullName': _fullName,
        'dateOfBirth': _dateOfBirth,
        'email': _email,
        'mobile': _mobile,
        'tasks': _tasks,
        'badge': _badges
      };
}
