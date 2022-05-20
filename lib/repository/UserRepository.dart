import '../entity/User.dart';
import 'BaseRepository.dart';

class UserRepository extends BaseRepository {
  User login(String? idNumber, String? password) {
    var entities = super.getEntities.map((e) => e as User).toList();

    return entities.firstWhere((element) =>
        element.idNumber == idNumber && element.password == password);
  }
}
