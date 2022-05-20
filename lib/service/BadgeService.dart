import '../entity/Badge.dart';
import '../repository/BadgeRepository.dart';
import '../repository/RepositoryFacroty.dart';
import '../utils/SequenceUtil.dart';

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
