import 'dart:convert';
import 'dart:io';
import 'package:backend_api/entity/Offer.dart';
import 'package:http/http.dart' as http;
import 'package:backend_api/service/ServiceFactory.dart';
import 'package:backend_api/service/OfferService.dart';
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
