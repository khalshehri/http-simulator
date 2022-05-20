import 'package:backend_api/entity/BaseEntity.dart';

class Offer extends BaseEntity {
  String? _category;
  String? _title;
  String? _description;
  String? _code;

  Offer(super._id, this._category, this._title, this._description, this._code);

  String? get category => _category;
  String? get description => _description;
  String? get title => _title;
  String? get code => _code;

  set setCategory(String category) => _category = category;
  set setDescription(String description) => _description = description;
  set setTitle(String title) => _title = title;
  set setCode(String code) => _code = code;

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
        0, json['category'], json['title'], json['description'], json['code']);
  }

  Map toJson() => {
        'id': super.id,
        'category': _category,
        'title': _title,
        'description': _description,
        'code': _code
      };
}
