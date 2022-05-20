import 'package:backend_api/entity/BaseEntity.dart';
import 'package:backend_api/entity/Complaint.dart';

import 'BaseRepository.dart';

class ComplaintRepository extends BaseRepository {
  List<Complaint> findAllComplaintsByUserId(int userId) {
    var entities = super.getEntities.map((e) => e as Complaint).toList();
    return entities.where((element) => element.userId == userId).toList();
  }
}
