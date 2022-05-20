import '../entity/BaseEntity.dart';

abstract class BaseRepository {
  List<BaseEntity> _entities = new List.empty(growable: true);

  BaseEntity findEntityById(int id) {
    return _entities.firstWhere((element) => element.id == id);
  }

  List<BaseEntity> findAllEntities() {
    return List.from(_entities);
  }

  void save(BaseEntity entity) {
    _entities.add(entity);
  }

  void updat(BaseEntity entity) {
    _entities.removeWhere((element) => element.id == entity.id);
    _entities.add(entity);
  }

  List<BaseEntity> get getEntities => _entities;
}
