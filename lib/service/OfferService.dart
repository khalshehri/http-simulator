import 'package:backend_api/entity/Offer.dart';
import 'package:backend_api/repository/OfferRepository.dart';
import 'package:backend_api/repository/RepositoryFacroty.dart';

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
