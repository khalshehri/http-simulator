import 'package:backend_api/entity/BaseEntity.dart';
import 'package:backend_api/entity/User.dart';
import 'package:backend_api/repository/BaseRepository.dart';

class UserRepository extends BaseRepository {
  User login(String? idNumber, String? password) {
    var entities = super.getEntities.map((e) => e as User).toList();

    return entities.firstWhere((element) =>
        element.idNumber == idNumber && element.password == password);
  }
}
