import '../entity/Offer.dart';
import '../repository/OfferRepository.dart';
import '../repository/RepositoryFacroty.dart';
import '../utils/SequenceUtil.dart';

class OfferService {
  final OfferRepository? _offerRepository =
      RepositoryFactory.getOfferRepository;

  void save(Offer input) {
    input.setId = SequenceUtils.nextOfferSequence;
    _offerRepository?.save(input);
  }

  List<Offer>? findOffersByCategory(String category) {
    return _offerRepository?.findOffersByCategory(category);
  }
}
