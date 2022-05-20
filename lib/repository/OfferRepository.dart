import '../entity/Offer.dart';
import 'BaseRepository.dart';

class OfferRepository extends BaseRepository {
  List<Offer> findOffersByCategory(String category) {
    var entities = super.getEntities.map((e) => e as Offer).toList();

    return entities.where((element) => element.category == category).toList();
  }
}
