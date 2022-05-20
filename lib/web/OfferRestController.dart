import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../entity/Offer.dart';
import '../service/OfferService.dart';
import '../service/ServiceFactory.dart';

class OfferRestController {
  final OfferService? _offerService = ServiceFactory.getOfferService;

  http.Response save(String jsonRequest) {
    _offerService?.save(Offer.fromJson(jsonDecode(jsonRequest)));
    return http.Response("", HttpStatus.created);
  }

  http.Response findAll(String category) {
    List<Offer>? offers = _offerService?.findOffersByCategory(category);
    return http.Response(jsonEncode(offers), HttpStatus.ok);
  }
}
