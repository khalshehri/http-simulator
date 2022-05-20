abstract class BaseEntity {
  int _id;

  BaseEntity(this._id);

  int get id => _id;
  set setId(int id) => _id = id;
}
