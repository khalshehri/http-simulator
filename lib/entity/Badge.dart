import 'BaseEntity.dart';

class Badge extends BaseEntity {
  String? _name;
  int _points = 0;
  String? _type;
  String? _description;

  Badge(super._id, this._name, this._points, this._type, this._description);

  String? get type => _type;
  String? get name => _name;
  int get points => _points;
  String? get description => _description;

  set setType(String type) => _type = type;
  set setName(String name) => _name = name;
  set setPoints(int points) => _points = points;
  set setDescription(String description) => _description = description;

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(json['id'] ?? 0, json['name'], json['points'], json['type'],
        json['description']);
  }

  Map toJson() => {
        'id': super.id,
        'name': _name,
        'points': _points,
        'description': _description,
        'type': _type
      };
}
