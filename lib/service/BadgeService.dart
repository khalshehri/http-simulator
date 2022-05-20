import 'package:backend_api/entity/Badge.dart';
import 'package:backend_api/repository/BadgeRepository.dart';
import 'package:backend_api/utils/SequenceUtil.dart';

import '../repository/RepositoryFacroty.dart';

class BadgeService {
  final BadgeRepository? _badgeRepository =
      RepositoryFactory.getBadgeRepository;

  void save(Badge input) {
    input.setId = SequenceUtils.nextBadgeSequence;
    _badgeRepository?.save(input);
  }

  List<Badge>? findAll() {
    return _badgeRepository?.findAllEntities().map((e) => e as Badge).toList();
  }

  Badge findOneById(int badgeId) {
    return _badgeRepository?.findEntityById(badgeId) as Badge;
  }
}
